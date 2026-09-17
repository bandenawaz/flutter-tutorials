import 'package:dio/dio.dart';
import 'package:neobank/core/errors/exceptions.dart';
import 'package:neobank/features/auth/data/models/user_model.dart';

/// Abstract interface for remote data operations
abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});

  Future<void> logout();

  Future<UserModel> getCurrentUser();
}

/// Implementation using Dio HTTP client
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Login failed',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw NetworkException(message: 'Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(message: 'No internet connection');
      } else {
        throw ServerException(
          message: e.message ?? 'Network error',
          statusCode: e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await client.post('/auth/logout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Logout failed');
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await client.get('/auth/me');

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Failed to get user',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Network error');
    }
  }
}
