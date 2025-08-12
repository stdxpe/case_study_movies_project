import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/auth_model.dart';
import 'package:case_study_movies_project/utilities/k_endpoints.dart';
import 'package:case_study_movies_project/models/auth_error_response.model.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
// ignore_for_file: unnecessary_null_comparison

class NodeLabsAuthService extends IAuthService {
  final Dio client;
  final ILoggerService logger;
  final ITokenStorageService tokenStorage;

  NodeLabsAuthService({
    required this.client,
    required this.logger,
    required this.tokenStorage,
  });

  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    const String endpoint = ApiEndpoints.login;
    final data = {'email': email, 'password': password};

    try {
      logger.logInfo('POST $endpoint → Signing in with $email');
      final response = await client.post(endpoint, data: data);

      if (response.statusCode == 200) {
        logger.logInfo('Successfully signed in $endpoint with $email');
        final authModel = AuthModel.fromMap(response.data);
        final token = authModel.token;

        if (token != null && token.isNotEmpty) {
          await tokenStorage.saveToken(token);
        } else {
          logger.logError(
              'POST $endpoint → ${AppStrings.errors.loginFailedWithCode} for $email: ${response.statusCode}');
          throw Exception(AppStrings.errors.loginFailedWithCode);
        }
        return authModel;
      } else if (response.statusCode == 400) {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.invalidCredentials400} for $email ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.invalidCredentials400}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.unauthorized401} for $email ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.unknown} for $email: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.loginFailedWithCode}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      if (error.response?.data != null) {
        final errorModel = AuthErrorResponseModel.fromMap(error.response!.data);
        logger.logError(
            'POST $endpoint → Login Failed with ${error.message} Backend response: $errorModel');
      } else {
        logger.logError('POST $endpoint → Exception: $error $stacktrace');
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
    const String endpoint = ApiEndpoints.register;
    final data = {'email': email, 'name': name, 'password': password};

    try {
      logger.logInfo('POST $endpoint → Registering in with $email');
      final response = await client.post(endpoint, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final authModel = AuthModel.fromMap(response.data);
        final token = authModel.token;

        if (token != null && token.isNotEmpty) {
          await tokenStorage.saveToken(token);
          logger.logError('POST $endpoint → Token saved from register');
        } else {
          logger.logError(
              'POST $endpoint → ${AppStrings.errors.registerSuccessNoToken} for $email: ${response.statusCode}');
          throw Exception(AppStrings.errors.registerSuccessNoToken);
        }

        return authModel;
      } else if (response.statusCode == 400) {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.invalidCredentials400} for $email ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.invalidCredentials400}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.unauthorized401} for $email ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.unknown} for $email: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.loginFailedWithCode}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      if (error.response?.data != null) {
        final errorModel = AuthErrorResponseModel.fromMap(error.response!.data);
        logger.logError(
            'POST $endpoint → Register Failed with ${error.message} Backend response: $errorModel');
      } else {
        logger.logError('POST $endpoint → Exception: $error $stacktrace');
      }
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    final hasToken = await tokenStorage.hasToken();

    if (hasToken) {
      await tokenStorage.deleteToken();
      logger.logInfo('User signed out, token deleted.');
    } else {
      logger.logInfo('SignOut called but no token found.');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await tokenStorage.getToken();
    return token != null && token.isNotEmpty;
  }
}
