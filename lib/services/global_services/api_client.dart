import 'package:dio/dio.dart';
import 'package:case_study_movies_project/utilities/k_endpoints.dart';
import 'package:case_study_movies_project/services/global_services/auth_interceptor.dart';

class ApiClient {
  final AuthInterceptor authInterceptor;

  ApiClient({required this.authInterceptor});

  Dio getDio() {
    final dio = Dio();

    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.interceptors.add(authInterceptor);

    return dio;
  }
}
