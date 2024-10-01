import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'INR';
  double _convertedValue = 0.0;
  String _inputValue = '';
  bool _isLoading = false;
  double _opacity = 0.0;

  final List<String> currencies = ['USD', 'EUR', 'INR', 'GBP', 'JPY'];

  // Function to fetch live exchange rates
  Future<void> _fetchExchangeRate() async {
    final String apiKey =
        'e83141668511abe07395c2620131c94f'; // Replace with your API key
    final url =
        'http://api.exchangeratesapi.io/v1/latest?access_key=$apiKey&base=$_fromCurrency&symbols=$_toCurrency';

    try {
      final response = await http.get(Uri.parse(url));

      // Check if the response was successful
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print('API Response: ${response.body}');

        // Check if the 'rates' key exists and is not null
        if (jsonResponse != null && jsonResponse['rates'] != null) {
          double rate = jsonResponse['rates'][_toCurrency];

          // Proceed with conversion
          _convertCurrency(rate);
        } else {
          // Handle case when 'rates' is null or missing
          print('Error: Rates not found in the response.');
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        throw Exception(
            'Failed to load exchange rate. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle other errors (network issues, parsing errors, etc.)
      print('Error fetching exchange rate: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to convert currency
  void _convertCurrency(double rate) {
    setState(() {
      double inputAmount = double.tryParse(_inputValue) ?? 0;
      _convertedValue = inputAmount * rate;
      _opacity = 1.0; // Trigger the animation
      _isLoading = false;
    });
  }

  void _onConvertPressed() {
    setState(() {
      _isLoading = true;
      _opacity = 0.0; // Reset animation
    });
    _fetchExchangeRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field for amount
            Text(
              'Enter amount:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
              onChanged: (value) {
                setState(() {
                  _inputValue = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Dropdown for "From" currency
            Row(
              children: [
                Text('From:', style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _fromCurrency,
                  onChanged: (newValue) {
                    setState(() {
                      _fromCurrency = newValue!;
                    });
                  },
                  items: currencies.map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Dropdown for "To" currency
            Row(
              children: [
                Text('To:', style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _toCurrency,
                  onChanged: (newValue) {
                    setState(() {
                      _toCurrency = newValue!;
                    });
                  },
                  items: currencies.map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Convert Button
            GestureDetector(
              onTap: _onConvertPressed,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Display the converted value with animation
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Text(
                'Converted Value: ${_convertedValue.toStringAsFixed(2)} $_toCurrency',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Display loading indicator
            if (_isLoading) ...[
              SizedBox(height: 20),
              Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }
}
