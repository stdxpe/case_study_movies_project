import 'package:case_study_movies_project/models/auth_model.dart';

abstract class IAuthService {
  Future<AuthModel> login({
    required String email,
    required String password,
  });

  Future<AuthModel> register({
    required String email,
    required String name,
    required String password,
  });
}
