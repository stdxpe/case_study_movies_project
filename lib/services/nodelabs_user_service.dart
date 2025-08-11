import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/user_model.dart';
import 'package:case_study_movies_project/models/user_response_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class NodeLabsUserService extends IUserService {
  final _dio = locator<Dio>();
  final _logger = locator<ILoggerService>();

  @override
  Future<UserModel> getProfile() async {
    const String endPoint = '/user/profile';

    try {
      _logger.logInfo('GET $endPoint → Fetching profile');
      final response = await _dio.get(endPoint);

      if (response.statusCode == 200) {
        _logger.logInfo('Successfully fetched profile from $endPoint');

        final profileResponse = UserProfileResponseModel.fromMap(response.data);
        return profileResponse.user;
      } else if (response.statusCode == 401) {
        _logger.logError(
            'GET $endPoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'GET $endPoint → ${AppStrings.errors.unknown}: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.profileFail}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      _logger.logError('GET $endPoint → Exception: $error $stacktrace');
      rethrow;
    }
  }

  @override
  Future<String> uploadPhoto(String filePath) async {
    const String endPoint = '/user/upload_photo';

    try {
      final file = await MultipartFile.fromFile(filePath);
      final formData = FormData.fromMap({'file': file});

      _logger.logInfo('Uploading photo to $endPoint');
      final response = await _dio.post(endPoint, data: formData);

      if (response.statusCode == 200) {
        final uploadResponse =
            UploadPhotoResponseModel.fromMap(response.data['data']);
        _logger.logInfo(
            'Successfully uploaded ${uploadResponse.photoUrl} to $endPoint');
        return uploadResponse.photoUrl;
      } else if (response.statusCode == 400) {
        _logger.logWarning(
            'POST $endPoint → ${AppStrings.errors.uploadPhotoInvalidFormat}: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.uploadPhotoInvalidFormat}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'POST $endPoint → ${AppStrings.errors.unknown}: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.photoServerUploadFail}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      _logger.logError('GET $endPoint → Exception: $error $stacktrace');
      rethrow;
    }
  }
}
