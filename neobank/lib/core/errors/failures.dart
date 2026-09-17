import 'package:equatable/equatable.dart';

/// Base falure class for all the errors in the app
abstract class Failure extends Equatable {
  /// A message describing the failure.
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

///Server related failures(500, 400, 403, 404)
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}

/// Network-related failures (no internet, timeout)
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});
}

/// Authentication failures (wrong password, invalid token)
class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.statusCode});
}

/// Cache-related failures (local storage errors)
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error occurred'});
}
