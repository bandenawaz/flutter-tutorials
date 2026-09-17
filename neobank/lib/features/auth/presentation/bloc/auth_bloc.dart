import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobank/features/auth/domain/usecases/login_usecase.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_event.dart';
import 'package:neobank/features/auth/presentation/bloc/auth_state.dart';

/// AuthBloc manages authentication state
/// It listens to events and emits states
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    // Register event handlers
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<AuthCheckRequested>(_onAuthCheckRequested);
  }

  /// Handle login request
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    // Emit loading state
    emit(AuthLoading());

    // Call use case
    final result = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    // Handle result using fold (functional programming)
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  /// Handle logout request
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    // TODO: Implement logout
    emit(AuthUnauthenticated());
  }

  /// Handle auth check on app start
  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    // TODO: Check if user has valid token
    emit(AuthUnauthenticated());
  }
}
