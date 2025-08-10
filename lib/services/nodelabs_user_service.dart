import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/user_model.dart';
import 'package:case_study_movies_project/models/user_response_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class NodeLabsUserService extends IUserService {
  final _dio = locator<Dio>();
  final _logger = locator<ILoggerService>();

  @override
  Future<UserModel> getProfile() async {
    const String endPoint = '/user/profile';

    try {
      _logger.logInfo('Fetching user profile from $endPoint');
      final response = await _dio.get(endPoint);

      if (response.statusCode == 200) {
        _logger.logInfo('User profile fetched successfully');
        final profileResponse = UserProfileResponseModel.fromMap(response.data);
        return profileResponse.user;
      } else if (response.statusCode == 401) {
        _logger.logWarning('Unauthorized access when fetching profile');
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'Failed to fetch user profile with status code ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.profileFail}: ${response.statusCode}');
      }
    } on DioException catch (e, stack) {
      _logger.logError('DioException in getProfile', error: e, stack: stack);
      rethrow;
    }
  }

  @override
  Future<String> uploadPhoto(String filePath) async {
    const String endPoint = '/user/upload_photo';

    try {
      _logger.logInfo('Uploading photo to $endPoint');
      final file = await MultipartFile.fromFile(filePath);
      final formData = FormData.fromMap({'file': file});

      final response = await _dio.post(endPoint, data: formData);

      _logger.logInfo('Upload photo response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final uploadResponse =
            UploadPhotoResponseModel.fromMap(response.data['data']);
        _logger.logInfo(
            'Photo uploaded successfully, url: ${uploadResponse.photoUrl}');
        return uploadResponse.photoUrl;
      } else if (response.statusCode == 400) {
        _logger.logWarning('Invalid file format for photo upload');
        throw Exception(
            '${AppStrings.errors.uploadPhotoInvalidFormat}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        _logger.logWarning('Unauthorized access when uploading photo');
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'Photo upload failed with status code ${response.statusCode}');
        throw Exception(
            '${AppStrings.errors.photoServerUploadFail}: ${response.statusCode}');
      }
    } on DioException catch (e, stack) {
      _logger.logError('DioException in uploadPhoto', error: e, stack: stack);
      rethrow;
    }
  }
}
