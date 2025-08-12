import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/user_model.dart';
import 'package:case_study_movies_project/utilities/k_endpoints.dart';
import 'package:case_study_movies_project/models/user_response_model.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';

class NodeLabsUserService extends IUserService {
  final Dio client;
  final ILoggerService logger;

  NodeLabsUserService({
    required this.client,
    required this.logger,
  });

  @override
  Future<UserModel> getProfile() async {
    const String endpoint = ApiEndpoints.profile;

    try {
      logger.logInfo('GET $endpoint → Fetching profile');
      final response = await client.get(endpoint);

      if (response.statusCode == 200) {
        logger.logInfo('Successfully fetched profile from $endpoint');

        final profileResponse = UserProfileResponseModel.fromMap(response.data);
        return profileResponse.user;
      } else if (response.statusCode == 401) {
        logger.logError(
            'GET $endpoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        logger.logError(
            'GET $endpoint → ${AppStrings.errors.unknown}: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.profileFail}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      logger.logError('GET $endpoint → Exception: $error $stacktrace');
      rethrow;
    }
  }

  @override
  Future<String> uploadPhoto(String filePath) async {
    const String endpoint = ApiEndpoints.uploadPhoto;

    try {
      final file = await MultipartFile.fromFile(filePath);
      final formData = FormData.fromMap({'file': file});

      logger.logInfo('Uploading photo to $endpoint');
      final response = await client.post(endpoint, data: formData);

      if (response.statusCode == 200) {
        final uploadResponse =
            UploadPhotoResponseModel.fromMap(response.data['data']);
        logger.logInfo(
            'Successfully uploaded ${uploadResponse.photoUrl} to $endpoint');
        return uploadResponse.photoUrl;
      } else if (response.statusCode == 400) {
        logger.logWarning(
            'POST $endpoint → ${AppStrings.errors.uploadPhotoInvalidFormat}: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.uploadPhotoInvalidFormat}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        logger.logError(
            'POST $endpoint → ${AppStrings.errors.unknown}: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.photoServerUploadFail}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      logger.logError('GET $endpoint → Exception: $error $stacktrace');
      rethrow;
    }
  }
}
