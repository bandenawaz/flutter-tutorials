import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:neobank/core/errors/failures.dart';
import 'package:neobank/features/auth/domain/entities/user.dart';
import 'package:neobank/features/auth/domain/repositories/auth_repository.dart';

/// UseCase encapsulates a single business action.
/// This one handles the "Login" business rule.
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  /// Call method makes the use case callable like a function
  Future<Either<Failure, User>> call(LoginParams params) async {
    // Business rule: Email must not be empty
    if (params.email.isEmpty) {
      return const Left(AuthFailure(message: 'Email cannot be empty'));
    }

    // Business rule: Password must be at least 8 characters
    if (params.password.length < 8) {
      return const Left(
        AuthFailure(message: 'Password must be at least 8 characters'),
      );
    }

    // If validation passes, call the repository
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

/// Parameters for the login use case
/// Using Equatable for easy comparison
class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
