import 'package:equatable/equatable.dart';
import 'package:neobank/features/auth/domain/entities/user.dart';

/// Base class for all auth states
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any action
class AuthInitial extends AuthState {}

/// Loading state during API calls
class AuthLoading extends AuthState {}

/// Success state after successful login
class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

/// Unauthenticated state (logged out or not logged in)
class AuthUnauthenticated extends AuthState {}

/// Error state when login fails
class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
