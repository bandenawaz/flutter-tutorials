import 'package:equatable/equatable.dart';

/// Base class for all auth events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when user submits login form
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

/// Event triggered when user logs out
class LogoutRequested extends AuthEvent {}

/// Event triggered when app starts (check if user is already logged in)
class AuthCheckRequested extends AuthEvent {}
