abstract class AuthState {
  bool get isAuthenticated => false;
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  @override
  bool get isAuthenticated => true;
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
