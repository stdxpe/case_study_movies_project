import 'package:case_study_movies_project/models/auth_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';

class NodeLabsAuthService extends IAuthService {
  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> register(
      {required String email,
      required String name,
      required String password}) async {
    throw UnimplementedError();
  }
}
