abstract class UserEvent {}

class UserLoginEvent extends UserEvent {}

class UserRegisterEvent extends UserEvent {}

class GetUserProfileEvent extends UserEvent {}

class UploadUserPhotoEvent extends UserEvent {
  final String filePath;
  UploadUserPhotoEvent({required this.filePath});
}
