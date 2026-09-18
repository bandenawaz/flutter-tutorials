import 'package:flutter/material.dart';
import 'package:bankease/app/theme.dart';
import 'package:bankease/features/accounts/domain/accounts.dart';
import 'package:bankease/features/dashboard/widgets/balance_card.dart';
import 'package:bankease/core/data/mock_data.dart';
import 'package:bankease/features/transactions/domain/txn.dart';
import 'package:bankease/features/transactions/widgets/transaction_tile.dart';

class BankEaseApp extends StatelessWidget {
  const BankEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankEase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              BalanceCard(account: MockData.accounts.first),
              const SizedBox(height: 16),
              for (final t in MockData.transactionFor('BE1001').take(5))
                TransactionTile(txn: t),
            ],
          ),
        ),
      ),
    );
  }
}
