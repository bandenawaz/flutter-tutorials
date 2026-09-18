import 'package:bankease/features/accounts/domain/accounts.dart';
import 'package:bankease/features/transactions/domain/txn.dart';
import 'package:bankease/features/transfer/domain/beneficiary.dart';

/// Hardcoded data for testing

abstract final class MockData {
  static const customerName = 'Zayaan Bagwan';
  static const customerId = '10012345';

  static String get firstName => customerName.split(' ').first;

  static const List<Account> accounts = [
    Account(
      id: 'BE1001',
      type: AccountType.savings,
      holderName: customerName,
      number: '123456789012',
      ifsc: 'SBIN0001234',
      branch: 'Mumbai Main Branch',
      balancePaise: 1234560,
    ),
    Account(
      id: 'BE2001',
      type: AccountType.current,
      holderName: customerName,
      number: '987654321098',
      ifsc: 'HDFC0005678',
      branch: 'Bangalore Main Branch',
      balancePaise: 9876543210,
    ),
  ];

  static Account? accountById(String id) {
    for (final account in accounts) {
      if (account.id == id) return account;
    }
    return null;
  }

  static const List<Beneficiary> beneficiaries = [
    Beneficiary(
      id: 'BEN1001',
      name: 'Ravi Kumar',
      accountNumber: '123456789012',
      ifsc: 'SBIN0001234',
    ),
    Beneficiary(
      id: 'BEN1002',
      name: 'Meera Traders',
      accountNumber: '987654321098',
      ifsc: 'HDFC0005678',
    ),
    Beneficiary(
      id: 'BEN1003',
      name: 'Suresh Patil',
      accountNumber: '456789123456',
      ifsc: 'BKEN0003344',
    ),
  ];

  /// 500 generated transactions so that statement proves Listview.builder works,

  static final List<Txn> transactions = _generateTransactions();

  static List<Txn> transactionFor(String accountId) =>
      transactions.where((t) => t.accountId == accountId).toList();

  static List<Txn> _generateTransactions() {
    const titles = [
      'Chai Stall',
      'Salary Credit',
      'Electricity Bill',
      'Food Delivery Order',
      'Mobile Recharge',
      'ATM Withdrawal',
      'Interest Credit',
      'Online Shopping - Venkata Satya Narayana Enterprises',
    ];

    const amounts = [
      -2000,
      650000,
      -184500,
      -45600,
      -29900,
      -500000,
      23400,
      -129900,
    ];
    final start = DateTime(2026, 9, 17, 18, 30);

    return List.generate(500, (i) {
      final k = i % titles.length;
      return Txn(
        txnId: 'T${1000 + i}',
        accountId: i % 3 == 0 ? 'BE2001' : 'BE1001',
        title: titles[k],
        amountPaise: amounts[k],
        date: start.subtract(Duration(hours: i * 7)),
        mode: amounts[k] < 0 ? 'UPI' : 'NEFT',
      );
    });
  }
}
