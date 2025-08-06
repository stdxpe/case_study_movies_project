import 'dart:convert';
import 'user_model.dart';

class AuthModel {
  final String token;
  final UserModel user;

  AuthModel({required this.token, required this.user});

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(token: map['token'], user: UserModel.fromMap(map['user']));
  }

  Map<String, dynamic> toMap() => {'token': token, 'user': user.toMap()};

  factory AuthModel.fromJson(String source) {
    return AuthModel.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  AuthModel copyWith({String? token, UserModel? user}) {
    return AuthModel(token: token ?? this.token, user: user ?? this.user);
  }

  @override
  String toString() => 'AuthModel(token: $token, user: $user)';
}
