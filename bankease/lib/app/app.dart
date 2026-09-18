import 'package:flutter/material.dart';
import 'package:bankease/app/theme.dart';

class BankEaseApp extends StatelessWidget {
  const BankEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankEase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to BankEase!', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
