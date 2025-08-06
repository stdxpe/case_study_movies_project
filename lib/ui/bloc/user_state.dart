import 'package:case_study_movies_project/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel userEntity;

  UserLoaded({required this.userEntity});
}

class UserPhotoUploaded extends UserState {
  final String photoUrl;
  UserPhotoUploaded(this.photoUrl);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}
