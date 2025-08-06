import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/auth_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class NodeLabsAuthService extends IAuthService {
  final Dio _dio = locator<Dio>();

  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    final data = {'email': email, 'password': password};
    const endPoint = '/user/login/';

    try {
      final response = await _dio.post(endPoint, data: data);

      if (response.statusCode == 200) {
        return AuthModel.fromMap(response.data);
      } else if (response.statusCode == 400) {
        throw Exception(
            '${AppStrings.errors.invalidCredentials400}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        throw Exception(
            '${AppStrings.errors.loginFailedWithCode}: ${response.statusCode}');
      }
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> register(
      {required String email,
      required String name,
      required String password}) async {
    final data = {'email': email, 'name': name, 'password': password};
    const endPoint = '/user/register/';

    try {
      final response = await _dio.post(endPoint, data: data);

      if (response.statusCode == 201) {
        return AuthModel.fromMap(response.data);
      } else if (response.statusCode == 400) {
        throw Exception(
            '${AppStrings.errors.invalidCredentials400}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        throw Exception(
            '${AppStrings.errors.loginFailedWithCode}: ${response.statusCode}');
      }
    } on DioException catch (_) {
      rethrow;
    }
  }
}
