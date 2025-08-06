import 'package:dio/dio.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ApiClient {
  Dio getDio() {
    Dio dio = Dio();
    dio.options.baseUrl = AppConstants.baseUrl;
    return dio;
  }
}
