void main() {
  // ==== VARIABLES ====
  // Variables are used to store data in a program.
  // They are declared using the var keyword followed by the variable name.
  var name = 'Nawaz'; // String
  var age = 25; // Integer
  var height = 5.10; // Double

  //lets print the details using String interpolation
  print('Name: $name');
  print('Age: $age');

  //Explicit Types - More clear and recommended way to declare variables

  String bankName = 'NeoBank';
  int accountNumber = 123456789;
  double balance = 1000.00;
  bool isActive = true;

  print('Bank Name: $bankName');
  print('Account Number: $accountNumber');
  print('Balance: $balance');
  print('Account is Active: $isActive');
}
