import 'package:dio/dio.dart';
import 'package:case_study_movies_project/models/user_model.dart';
import 'package:case_study_movies_project/models/user_response_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class NodeLabsUserService extends IUserService {
  final Dio _dio = locator<Dio>();

  @override
  Future<UserModel> getProfile() async {
    const String endPoint = '/user/profile';

    try {
      final response = await _dio.get(endPoint);

      if (response.statusCode == 200) {
        final profileResponse = UserProfileResponseModel.fromMap(response.data);
        return profileResponse.user;
      } else if (response.statusCode == 401) {
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        throw Exception(
            '${AppStrings.errors.profileFail}: ${response.statusCode}');
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<String> uploadPhoto(String filePath) async {
    const String endPoint = '/user/upload_photo';

    try {
      final file = await MultipartFile.fromFile(filePath);
      final formData = FormData.fromMap({'file': file});

      final response = await _dio.post(endPoint, data: formData);

      if (response.statusCode == 200) {
        final uploadResponse = UploadPhotoResponseModel.fromMap(response.data);
        return uploadResponse.photoUrl;
      } else if (response.statusCode == 400) {
        throw Exception(
            '${AppStrings.errors.uploadPhotoInvalidFormat}: ${response.statusCode}');
      } else if (response.statusCode == 401) {
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        throw Exception(
            '${AppStrings.errors.uploadPhotoFail}: ${response.statusCode}');
      }
    } on DioException {
      rethrow;
    }
  }
}
