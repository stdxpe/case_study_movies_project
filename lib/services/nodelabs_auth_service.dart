import 'package:dio/dio.dart';
import 'package:case_study_movies_project/models/auth_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
// ignore_for_file: unnecessary_null_comparison

class NodeLabsAuthService extends IAuthService {
  final _dio = locator<Dio>();
  final _logger = locator<ILoggerService>();
  final _tokenStorage = locator<ITokenStorageService>();

  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    const endPoint = '/user/login';
    final data = {'email': email, 'password': password};

    try {
      final response = await _dio.post(endPoint, data: data);

      if (response.statusCode == 200) {
        final authModel = AuthModel.fromMap(response.data);
        final token = authModel.token;

        if (token != null && token.isNotEmpty) {
          await _tokenStorage.saveToken(token);
        } else {
          throw Exception(AppStrings.errors.loginFailedWithCode);
        }
        return authModel;
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
    } on DioException catch (e) {
      _logger.logError(
          'Login failed: ${e.message}, Backend response: ${e.response?.data}');
      rethrow;
    }
  }

  @override
  Future<AuthModel> register({
    required String email,
    required String name,
    required String password,
  }) async {
    const String endPoint = '/user/register';
    final data = {'email': email, 'name': name, 'password': password};

    try {
      final response = await _dio.post(endPoint, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final authModel = AuthModel.fromMap(response.data);
        final token = authModel.token;

        if (token != null && token.isNotEmpty) {
          await _tokenStorage.saveToken(token);
          _logger.logInfo('Token saved from register');
        } else {
          throw Exception(AppStrings.errors.registerSuccessNoToken);
        }

        return authModel;
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
    } on DioException catch (e) {
      _logger.logError(
          'Register failed: ${e.message}, backend response: ${e.response?.data}');
      rethrow;
    }
  }
}
