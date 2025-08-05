import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
      };

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl,
      );

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, photoUrl: $photoUrl)';
  }
}
