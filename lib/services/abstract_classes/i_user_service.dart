import 'package:case_study_movies_project/models/user_model.dart';

abstract class IUserService {
  Future<UserModel> getProfile();
  Future<String> uploadPhoto(String filePath);
}
