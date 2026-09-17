import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_event.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final userName = authState is AuthAuthenticated
        ? authState.user.name
        : 'User';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B4D7A),
        foregroundColor: Colors.white,
        title: const Text('NeoBank'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_balance_wallet,
              size: 80,
              color: Color(0xFF1B4D7A),
            ),
            const SizedBox(height: 24),
            Text(
              'Welcome back, $userName!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4D7A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your balance: \$15,420.50',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to Transfer screen
              },
              icon: const Icon(Icons.send),
              label: const Text('Send Money'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B4D7A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
