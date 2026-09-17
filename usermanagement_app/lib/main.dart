import 'package:flutter/material.dart';
import 'package:usermanagement_app/screens/dashboard_screen.dart';
import 'package:usermanagement_app/screens/login_screen.dart';
import 'package:usermanagement_app/screens/registration_screen.dart';
import 'package:usermanagement_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/register': (context) => RegistrationScreen(),
      },
    );
  }
}
