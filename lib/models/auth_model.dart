import 'dart:convert';
import 'user_model.dart';

class AuthModel {
  final String token;
  final UserModel user;

  AuthModel({
    required this.token,
    required this.user,
  });

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    final data = map['data'];
    return AuthModel(
      token: data['token'],
      user: UserModel.fromMap(data),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      ...user.toMap(),
    };
  }

  factory AuthModel.fromJson(String source) {
    return AuthModel.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  AuthModel copyWith({String? token, UserModel? user}) {
    return AuthModel(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'AuthModel(token: $token, user: $user)';
}
