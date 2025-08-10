import 'package:dio/dio.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ApiClient {
  Dio getDio() {
    final dio = Dio();

    dio.options.baseUrl = AppConstants.baseUrl;
    dio.interceptors.add(AuthInterceptor());

    return dio;
  }
}

class AuthInterceptor extends Interceptor {
  final _tokenStorage = locator<ITokenStorageService>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _tokenStorage.getToken();

      if (token != null && token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
        options.headers["Content-Type"] = "application/json";
      }
    } catch (_) {}

    super.onRequest(options, handler);
  }
}
