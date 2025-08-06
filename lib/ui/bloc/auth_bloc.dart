// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/models/auth_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/ui/bloc/auth_event.dart';
import 'package:case_study_movies_project/ui/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<SignOutEvent>(_onSignOut);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final AuthModel authModel = await authService.login(
        email: event.email,
        password: event.password,
      );

      if (authModel.token != null && authModel.token.isNotEmpty) {
        emit(AuthSuccess());
      } else {
        emit(AuthError('Login failed: empty token received'));
      }
    } catch (e) {
      emit(AuthError('Login failed: ${e.toString()}'));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final AuthModel authModel = await authService.register(
        email: event.email,
        name: event.name,
        password: event.password,
      );

      if (authModel.token != null && authModel.token.isNotEmpty) {
        emit(AuthSuccess());
      } else {
        emit(AuthError('Register failed: empty token received'));
      }
    } catch (e) {
      emit(AuthError('Register failed: ${e.toString()}'));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authService.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError('Sign out failed: ${e.toString()}'));
    }
  }

  void _onCheckAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final hasToken = await authService.isAuthenticated();
      if (hasToken) {
        emit(AuthSuccess());
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthError('Token check failed: ${e.toString()}'));
    }
  }
}
