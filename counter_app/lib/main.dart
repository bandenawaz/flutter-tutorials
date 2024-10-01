import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//My App is a stateless widget, which means it wont change once its built
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //lets set the title of the app
      title: "Counter Application",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//The state of HomePage
class _MyHomePageState extends State<MyHomePage> {
  //lets define a variable to store the counter value
  int _counter = 0;

  //Lets write a function to increment the state or counter variable
  void _incrementCounter() {
    setState(() {
      _counter++; // Update the counter value and rebuild the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold is widget that provides basic app structure
      appBar: AppBar(
        title: Text('Flutter Counter App'),
      ),
      //lets design the content
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have clicked the button these many time"),
            Text(
              '$_counter', //Display the counter value
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      //A floating action button that calls the increment function when pressed
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
