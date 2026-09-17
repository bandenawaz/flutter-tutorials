import 'package:neobank/core/errors/exceptions.dart';
import 'package:neobank/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:neobank/features/auth/data/models/user_model.dart';

/// A mock implementation of AuthRemoteDataSource for testing/development.
/// This simulates network delays and fake backend responses.
class AuthRemoteDataSourceMock implements AuthRemoteDataSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // Simulate network delay (1.5 seconds)
    await Future.delayed(const Duration(milliseconds: 1500));

    // Fake backend validation
    if (email == 'admin@neobank.com' && password == 'password123') {
      return const UserModel(
        id: 'user_123',
        name: 'Azmat',
        email: 'admin@neobank.com',
        balance: 15420.50,
        profileImageUrl: null,
      );
    }

    // If credentials are wrong, throw a ServerException
    throw const ServerException(
      message: 'Invalid email or password',
      statusCode: 401,
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<UserModel> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const UserModel(
      id: 'user_123',
      name: 'Azmat',
      email: 'admin@neobank.com',
      balance: 15420.50,
      profileImageUrl: null,
    );
  }
}
