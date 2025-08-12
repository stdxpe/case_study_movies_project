import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/models/auth_model.dart';
import 'package:case_study_movies_project/ui/bloc/auth_event.dart';
import 'package:case_study_movies_project/ui/bloc/auth_state.dart';
import 'package:case_study_movies_project/models/auth_error_response.model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
// ignore_for_file: unnecessary_null_comparison

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;
  final ILoggerService logger;

  AuthBloc({required this.authService, required this.logger})
      : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<SignOutEvent>(_onSignOut);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    logger.logInfo('Login started');
    emit(AuthLoading());
    try {
      final AuthModel authModel = await authService.login(
        email: event.email,
        password: event.password,
      );

      if (authModel.token != null && authModel.token.isNotEmpty) {
        emit(AuthSuccess());
        logger.logInfo('Login successful');
      } else {
        emit(AuthError('Login failed: empty token received'));
        logger.logWarning('Login failed: empty token');
      }
    } catch (e, stack) {
      AuthErrorResponseModel? errorResponse;
      try {
        if (e is DioException && e.response?.data is Map<String, dynamic>) {
          errorResponse = AuthErrorResponseModel.fromMap(
              e.response!.data as Map<String, dynamic>);
        }
      } catch (_) {}
      final errorMessage = errorResponse?.message ?? e.toString();
      emit(AuthError(errorMessage));
      logger.logError('Login error',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    logger.logInfo('Register started');
    emit(AuthLoading());
    try {
      final AuthModel authModel = await authService.register(
        email: event.email,
        name: event.name,
        password: event.password,
      );
      if (authModel.token != null && authModel.token.isNotEmpty) {
        emit(AuthSuccess());
        logger.logInfo('Register successful');
      } else {
        emit(AuthError('Register failed: empty token received'));
        logger.logWarning('Register failed: empty token');
      }
    } catch (e, stack) {
      AuthErrorResponseModel? errorResponse;
      try {
        if (e is DioException && e.response?.data is Map<String, dynamic>) {
          errorResponse = AuthErrorResponseModel.fromMap(
              e.response!.data as Map<String, dynamic>);
        }
      } catch (_) {}
      final errorMessage = errorResponse?.message ?? e.toString();
      emit(AuthError(errorMessage));
      logger.logError('Register error',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    logger.logInfo('Sign out started');
    emit(AuthLoading());
    try {
      await authService.signOut();
      emit(AuthInitial());
      logger.logInfo('Sign out successful');
    } catch (e, stack) {
      emit(AuthError('Sign out failed: ${e.toString()}'));
      logger.logError('Sign out error',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
    }
  }

  void _onCheckAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    logger.logInfo('Auth status check started');
    emit(AuthLoading());
    try {
      final hasToken = await authService.isAuthenticated();
      if (hasToken) {
        emit(AuthSuccess());
        logger.logInfo('Auth token found');
      } else {
        emit(AuthInitial());
        logger.logInfo('No auth token found');
      }
    } catch (e, stack) {
      emit(AuthError('Token check failed: ${e.toString()}'));
      logger.logError('Auth status check error',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
    }
  }
}
