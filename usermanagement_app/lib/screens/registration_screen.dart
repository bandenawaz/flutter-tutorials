import 'package:flutter/material.dart';
import 'package:usermanagement_app/db/db_helper.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  int? userId; // To track if it's an update

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (user != null) {
      // Populate fields for update
      userId = user['id'];
      _fullnameController.text = user['fullname'];
      _emailController.text = user['email'];
      _passwordController.text = user['password'];
    }
  }

  void _saveUser() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> user = {
        'fullname': _fullnameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      };

      if (userId != null) {
        // Update existing user
        await DatabaseHelper().updateUser(user, userId!);
      } else {
        // Insert new user
        await DatabaseHelper().insertUser(user);
      }

      Navigator.pop(context, true); // Return to previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userId == null ? 'Register' : 'Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Enter an email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Enter a password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveUser,
                child: Text(userId == null ? 'Register' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
