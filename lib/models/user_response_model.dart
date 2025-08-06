import 'dart:convert';
import 'package:case_study_movies_project/models/user_model.dart';

class UserProfileResponseModel {
  final UserModel user;

  UserProfileResponseModel({required this.user});

  factory UserProfileResponseModel.fromMap(Map<String, dynamic> map) {
    return UserProfileResponseModel(user: UserModel.fromMap(map['data']));
  }

  Map<String, dynamic> toMap() => {'user': user.toMap()};

  factory UserProfileResponseModel.fromJson(String source) {
    return UserProfileResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  UserProfileResponseModel copyWith({UserModel? user}) {
    return UserProfileResponseModel(
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'UserProfileResponseModel(user: $user)';
}

class UploadPhotoResponseModel {
  final String photoUrl;

  UploadPhotoResponseModel({required this.photoUrl});

  factory UploadPhotoResponseModel.fromMap(Map<String, dynamic> map) {
    return UploadPhotoResponseModel(photoUrl: map['photoUrl']);
  }

  Map<String, dynamic> toMap() => {'photoUrl': photoUrl};

  factory UploadPhotoResponseModel.fromJson(String source) =>
      UploadPhotoResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  UploadPhotoResponseModel copyWith({String? photoUrl}) {
    return UploadPhotoResponseModel(photoUrl: photoUrl ?? this.photoUrl);
  }

  @override
  String toString() => 'UploadPhotoResponseModel(photoUrl: $photoUrl)';
}
