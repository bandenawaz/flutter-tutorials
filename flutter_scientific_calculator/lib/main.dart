import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(ScientificCalculatorApp());
}

class ScientificCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorScreen(),
    );
  }
}
