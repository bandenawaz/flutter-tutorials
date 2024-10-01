import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_scientific_calculator/widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = "";
  String _result = "0";

  // Function to update the expression
  void _onButtonPressed(String text) {
    setState(() {
      _expression += text;
    });
  }

  // Function to clear the expression
  void _clearExpression() {
    setState(() {
      _expression = "";
      _result = "0";
    });
  }

  // Function to evaluate the expression
  void _calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        _result = eval.toString();
      });
    } catch (e) {
      setState(() {
        _result = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scientific Calculator"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display for the expression and result
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expression,
                      style: TextStyle(fontSize: 32, color: Colors.black54),
                    ),
                    SizedBox(height: 16),
                    Text(
                      _result,
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Scientific and Calculator buttons
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Row for scientific operations
                    Row(
                      children: [
                        CalculatorButton(
                          text: "sin",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "cos",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "tan",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "log",
                          onTap: _onButtonPressed,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          text: "sqrt",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "^",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "π",
                          onTap: (String text) {
                            _onButtonPressed("3.14159");
                          },
                        ),
                        CalculatorButton(
                          text: "e",
                          onTap: (String text) {
                            _onButtonPressed("2.71828");
                          },
                        ),
                      ],
                    ),
                    // Regular calculator buttons
                    Row(
                      children: [
                        CalculatorButton(
                          text: "7",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "8",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "9",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "/",
                          onTap: _onButtonPressed,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          text: "4",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "5",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "6",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "*",
                          onTap: _onButtonPressed,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          text: "1",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "2",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "3",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "-",
                          onTap: _onButtonPressed,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          text: "0",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: ".",
                          onTap: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: "C",
                          onTap: (String text) {
                            _clearExpression();
                          },
                          color: Colors.red,
                        ),
                        CalculatorButton(
                          text: "+",
                          onTap: _onButtonPressed,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CalculatorButton(
                          text: "=",
                          onTap: (String text) {
                            _calculateResult();
                          },
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
