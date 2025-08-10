import 'package:case_study_movies_project/models/user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;
  final String? errorMessage;
  final String? selectedPhotoPath;

  const UserState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
    this.selectedPhotoPath,
  });

  UserState copyWith({
    UserModel? user,
    bool? isLoading,
    String? errorMessage,
    String? selectedPhotoPath,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedPhotoPath: selectedPhotoPath ?? this.selectedPhotoPath,
    );
  }

  static UserState get initial => const UserState();
}
