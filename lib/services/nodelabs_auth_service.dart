import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/auth_model.dart';
import 'package:case_study_movies_project/models/auth_error_response.model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';
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
      _logger.logInfo('POST $endPoint → Signing in with $email');
      final response = await _dio.post(endPoint, data: data);

      if (response.statusCode == 200) {
        _logger.logInfo('Successfully signed in $endPoint with $email');
        final authModel = AuthModel.fromMap(response.data);
        final token = authModel.token;

        if (token != null && token.isNotEmpty) {
          await _tokenStorage.saveToken(token);
        } else {
          _logger.logError(
              'POST $endPoint → ${AppStrings.errors.loginFailedWithCode} for $email: ${response.statusCode}');
          throw Exception(AppStrings.errors.loginFailedWithCode);
        }
        return authModel;
      } else if (response.statusCode == 400) {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.invalidCredentials400} for $email ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.invalidCredentials400}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.unauthorized401} for $email ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.unknown} for $email: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.loginFailedWithCode}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      if (error.response?.data != null) {
        final errorModel = AuthErrorResponseModel.fromMap(error.response!.data);
        _logger.logError(
            'POST $endPoint → Login Failed with ${error.message} Backend response: $errorModel');
      } else {
        _logger.logError('POST $endPoint → Exception: $error $stacktrace');
      }
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
      _logger.logInfo('POST $endPoint → Registering in with $email');
      final response = await _dio.post(endPoint, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final authModel = AuthModel.fromMap(response.data);
        final token = authModel.token;

        if (token != null && token.isNotEmpty) {
          await _tokenStorage.saveToken(token);
          _logger.logError('POST $endPoint → Token saved from register');
        } else {
          _logger.logError(
              'POST $endPoint → ${AppStrings.errors.registerSuccessNoToken} for $email: ${response.statusCode}');
          throw Exception(AppStrings.errors.registerSuccessNoToken);
        }

        return authModel;
      } else if (response.statusCode == 400) {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.invalidCredentials400} for $email ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.invalidCredentials400}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.unauthorized401} for $email ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.unknown} for $email: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.loginFailedWithCode}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      if (error.response?.data != null) {
        final errorModel = AuthErrorResponseModel.fromMap(error.response!.data);
        _logger.logError(
            'POST $endPoint → Register Failed with ${error.message} Backend response: $errorModel');
      } else {
        _logger.logError('POST $endPoint → Exception: $error $stacktrace');
      }
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    final hasToken = await _tokenStorage.hasToken();

    if (hasToken) {
      await _tokenStorage.deleteToken();
      _logger.logInfo('User signed out, token deleted.');
    } else {
      _logger.logInfo('SignOut called but no token found.');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _tokenStorage.getToken();
    return token != null && token.isNotEmpty;
  }
}
