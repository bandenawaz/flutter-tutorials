import 'package:flutter/material.dart';

void main() {
  runApp(const BankEaseApp());
}

class BankEaseApp extends StatelessWidget {
  const BankEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankEase',
      theme: ThemeData(colorSchemeSeed: const Color(0xFF0E6B5C)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BankEase')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: BalanceCard(holderName: 'Zayaan', balance: '₹10,00,000.00'),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.holderName,
    required this.balance,
  });

  final String holderName;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, $holderName!'),
            const SizedBox(height: 8),
            Text(
              'Your current balance is: $balance',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
