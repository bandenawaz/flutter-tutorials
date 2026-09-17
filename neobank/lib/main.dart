import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobank/core/di/injection_container.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_state.dart';
import 'package:neobank/features/auth/presentation/pages/login_page.dart';

import 'package:neobank/features/auth/dashboard/presentation/pages/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: const NeoBankApp(),
    ),
  );
}

class NeoBankApp extends StatelessWidget {
  const NeoBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DashboardPage()),
          );
        } else if (state is AuthUnauthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return const LoginPage();
        },
      ),
    );
  }
}
