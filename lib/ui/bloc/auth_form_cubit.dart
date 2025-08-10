import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/auth_event.dart';
import 'package:case_study_movies_project/ui/bloc/auth_state.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class AuthFormState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isValid;
  final bool isSubmitting;
  final bool isPasswordVisible;

  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? generalError;

  const AuthFormState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isValid = false,
    this.isSubmitting = false,
    this.isPasswordVisible = false,
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.generalError,
  });

  AuthFormState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isValid,
    bool? isSubmitting,
    bool? isPasswordVisible,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? generalError,
  }) {
    return AuthFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      generalError: generalError,
    );
  }
}

class AuthFormCubit extends Cubit<AuthFormState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> _authSubscription;

  AuthFormCubit({required this.authBloc}) : super(const AuthFormState()) {
    _authSubscription = authBloc.stream.listen((authState) {
      if (authState is AuthError) {
        final backendMessage = authState.message;

        emit(state.copyWith(
          isSubmitting: false,
          generalError: backendMessage,
        ));
      } else if (authState is AuthSuccess) {
        emit(state.copyWith(
          isSubmitting: false,
          generalError: null,
        ));
      }
    });
  }

  void nameChanged(String name) {
    final nameError = _validateName(name);
    emit(state.copyWith(name: name, nameError: nameError, generalError: null));
    _updateValidity();
  }

  void emailChanged(String email) {
    final emailError = _validateEmail(email);
    emit(state.copyWith(
        email: email, emailError: emailError, generalError: null));
    _updateValidity();
  }

  void passwordChanged(String password) {
    final passwordError = _validatePassword(password);
    emit(state.copyWith(
        password: password, passwordError: passwordError, generalError: null));
    _updateValidity();
  }

  void confirmPasswordChanged(String confirmPassword) {
    final confirmPasswordError =
        _validateConfirmPassword(state.password, confirmPassword);
    emit(state.copyWith(
        confirmPassword: confirmPassword,
        confirmPasswordError: confirmPasswordError,
        generalError: null));
    _updateValidity();
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void signIn(bool isValid, bool isSubmitting) {
    if (isSubmitting) return;

    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);

    if (emailError != null || passwordError != null) {
      emit(state.copyWith(
          emailError: emailError,
          passwordError: passwordError,
          generalError: null));
      return;
    }

    emit(state.copyWith(
        isSubmitting: true,
        emailError: null,
        passwordError: null,
        generalError: null));

    authBloc.add(LoginEvent(email: state.email, password: state.password));
  }

  void signUp(bool isValid, bool isSubmitting) {
    if (isSubmitting) return;

    final nameError = _validateName(state.name);
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);
    final confirmPasswordError =
        _validateConfirmPassword(state.password, state.confirmPassword);

    if (nameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      emit(state.copyWith(
        nameError: nameError,
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
        generalError: null,
      ));
      return;
    }

    emit(state.copyWith(
      isSubmitting: true,
      nameError: null,
      emailError: null,
      passwordError: null,
      confirmPasswordError: null,
      generalError: null,
    ));

    authBloc.add(RegisterEvent(
      name: state.name,
      email: state.email,
      password: state.password,
    ));
  }

  void _updateValidity() {
    final valid = _validateName(state.name) == null &&
        _validateEmail(state.email) == null &&
        _validatePassword(state.password) == null &&
        _validateConfirmPassword(state.password, state.confirmPassword) == null;
    emit(state.copyWith(isValid: valid));
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

  String? _validateName(String name) {
    if (name.isEmpty) return AppStrings.errors.nameEmpty;
    if (name.length < 2) return AppStrings.errors.nameTooShort;
    return null;
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return AppStrings.errors.emailEmpty;
    if (!email.contains('@')) return AppStrings.errors.emailInvalid;
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return AppStrings.errors.passwordEmpty;
    if (password.length < 4) return AppStrings.errors.passwordTooShort;
    return null;
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return AppStrings.errors.confirmPasswordEmpty;
    if (password != confirmPassword) return AppStrings.errors.passwordsNotMatch;
    return null;
  }
}
