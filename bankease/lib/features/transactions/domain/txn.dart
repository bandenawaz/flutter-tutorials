class Txn {
  final String txnId;
  final String accountId;
  final String title;
  final int amountPaise; // negative = debit
  final DateTime date;
  final String mode; // UPI, NEFT, IMPS, ...

  const Txn({
    required this.txnId,
    required this.accountId,
    required this.title,
    required this.amountPaise,
    required this.date,
    required this.mode,
  });

  bool get isDebit => amountPaise < 0;
}
