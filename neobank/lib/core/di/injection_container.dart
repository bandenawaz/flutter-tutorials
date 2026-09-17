import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobank/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:neobank/features/auth/data/datasources/remote/auth_remote_datasource_mock.dart';
import 'package:neobank/features/auth/domain/repositories/auth_repository_impl.dart';
import 'package:neobank/features/auth/domain/repositories/auth_repository.dart';
import 'package:neobank/features/auth/domain/usecases/login_usecase.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_bloc.dart';

/// GetIt instance - Service locator for dependency injection
final sl = GetIt.instance;

/// Initialize all dependencies
Future<void> init() async {
  // External
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.neobank.com', // TODO: Move to constants
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );

  // // Data Sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(client: sl()),
  // );

  // USE MOCK FOR NOW (Until real backend is ready)
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceMock(),
  );
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // BLoCs
  sl.registerFactory<AuthBloc>(() => AuthBloc(loginUseCase: sl()));
}
