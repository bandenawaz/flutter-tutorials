import 'package:dartz/dartz.dart';
import 'package:neobank/core/errors/failures.dart';
import 'package:neobank/features/auth/domain/entities/user.dart';

/// Abstract repository defines WHAT the auth feature can do.
/// It does NOT define HOW (that's the data layer's job).
abstract class AuthRepository {
  /// Login with email and password
  /// Returns Either<Failure, User> - functional programming pattern
  /// Left = Failure (error), Right = User (success)
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  /// Logout current user
  Future<Either<Failure, void>> logout();

  /// Get currently logged-in user
  Future<Either<Failure, User>> getCurrentUser();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();
}
