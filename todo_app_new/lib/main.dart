import 'package:flutter/material.dart';
import 'package:todo_app_new/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo-App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
            headlineMedium:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 18)),
      ),
      home: HomeScreen(),
    );
  }
}
