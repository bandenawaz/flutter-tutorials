void main() {
  print('=== Function Examples ===\n');

  // ===== FUNCTION TYPES =====

  // 1. Void function (no return)
  printWelcome('Azmat');

  // 2. Function with return value
  double balance = calculateBalance(10000, 2500, 500);
  print('New balance: \$${balance.toStringAsFixed(2)}\n');

  // 3. Function with parameters
  transferMoney(from: 'acc_123', to: 'acc_456', amount: 1000);

  // 4. Arrow function (single expression)
  int sum = add(5, 3);
  print('Sum: $sum\n');

  // 5. Optional parameters
  createAccount('Azmat', email: 'azmat@neobank.com');
  createAccount('John'); // email is optional

  // 6. Default parameters
  printLoanDetails('Azmat', interestRate: 5.5);
  printLoanDetails('Sarah'); // Uses default 7.0

  // 7. Callback functions
  processPayment(500, () {
    print('✅ Payment successful!\n');
  });
}

// Function that prints welcome message
void printWelcome(String name) {
  print('Welcome to NeoBank, $name!');
}

// Function with return value
double calculateBalance(double initial, deposit, withdrawal) {
  return initial + deposit - withdrawal;
}

// Named parameters (more readable)
void transferMoney({
  required String from,
  required String to,
  required double amount,
}) {
  print('Transferring \$${amount.toStringAsFixed(2)}');
  print('From: $from → To: $to\n');
}

// Arrow function (concise)
int add(int a, int b) => a + b;

// Optional parameter
void createAccount(String name, {String? email}) {
  print('Creating account for: $name');
  if (email != null) {
    print('Email: $email');
  }
  print('');
}

// Default parameter
void printLoanDetails(String customer, {double interestRate = 7.0}) {
  print('$customer - Interest Rate: ${interestRate}%\n');
}

// Callback function
void processPayment(double amount, void Function() onSuccess) {
  print('Processing payment of \$${amount.toStringAsFixed(2)}...');
  // Simulate processing
  onSuccess();
}
