import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_state.dart';
import 'package:neobank/features/auth/presentation/widgets/login_form.dart';

/// Login Page - The main screen for authentication
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                const Icon(
                  Icons.account_balance,
                  size: 80,
                  color: Color(0xFF1B4D7A),
                ),
                const SizedBox(height: 16),

                // Title
                const Text(
                  'Welcome to NeoBank',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B4D7A),
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle
                const Text(
                  'Banking made simple',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 48),

                // Login Form
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthAuthenticated) {
                      // Navigate to dashboard
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Welcome, ${state.user.name}!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else if (state is AuthError) {
                      // Show error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return const LoginForm();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
