import 'package:case_study_movies_project/models/user_model.dart';

/// API JSON Response Model for User Profile
class UserProfileResponseModel {
  final UserModel user;

  UserProfileResponseModel({required this.user});

  factory UserProfileResponseModel.fromMap(Map<String, dynamic> map) {
    return UserProfileResponseModel(
      user: UserModel.fromMap(map['user']),
    );
  }

  Map<String, dynamic> toMap() => {'user': user.toMap()};
}

/// API JSON Response Model for Upload Photo Response
class UploadPhotoResponseModel {
  final String photoUrl;

  UploadPhotoResponseModel({required this.photoUrl});

  factory UploadPhotoResponseModel.fromMap(Map<String, dynamic> map) {
    return UploadPhotoResponseModel(
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() => {'photoUrl': photoUrl};
}
