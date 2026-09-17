void main() {
  // ===== IF-ELSE STATEMENTS =====

  int balance = 5000;
  int withdrawalAmount = 3000;

  print('=== Banking Logic ===\n');

  if (withdrawalAmount > balance) {
    print('❌ Insufficient funds!');
  } else if (withdrawalAmount <= 0) {
    print('❌ Amount must be positive!');
  } else {
    print('✅ Withdrawal successful!');
    print('New balance: \$${balance - withdrawalAmount}');
  }

  // ===== NULL AWARE OPERATORS =====

  String? email; // Nullable string (can be null)
  String name = 'Azmat';

  // ?? operator - Provide default if null
  String userEmail = email ?? 'no-email@neobank.com';
  print('\nEmail: $userEmail');

  // ?. operator - Safe navigation
  print('Email length: ${email?.length ?? 0}');

  // ===== TERNARY OPERATOR =====

  bool isPremium = true;
  String accountType = isPremium ? 'Premium' : 'Basic';
  print('\nAccount Type: $accountType');

  // ===== SWITCH CASE =====

  String day = 'Monday';

  switch (day) {
    case 'Monday':
      print('\nStart of work week!');
      break;
    case 'Friday':
      print('\nTGIF! Weekend soon!');
      break;
    case 'Saturday':
    case 'Sunday':
      print('\nWeekend!');
      break;
    default:
      print('\nMidweek grind...');
  }

  // ===== LOOPS =====

  print('\n=== For Loop ===');
  for (int i = 1; i <= 5; i++) {
    print('Transaction #$i');
  }

  print('\n=== For-Each Loop ===');
  List<String> transactions = ['Deposit', 'Withdrawal', 'Transfer'];
  for (var transaction in transactions) {
    print('Processing: $transaction');
  }

  print('\n=== While Loop ===');
  int attempts = 3;
  while (attempts > 0) {
    print('Login attempts left: $attempts');
    attempts--;
  }

  // ===== BREAK & CONTINUE =====

  print('\n=== Break & Continue ===');
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print('Skipping 5...');
      continue; // Skip this iteration
    }
    if (i == 8) {
      print('Stopping at 8...');
      break; // Exit loop
    }
    print('Number: $i');
  }
}
