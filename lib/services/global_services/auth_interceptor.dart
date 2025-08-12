import 'package:dio/dio.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final ITokenStorageService tokenStorage;

  AuthInterceptor({required this.tokenStorage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await tokenStorage.getToken();

      if (token != null && token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
        options.headers["Content-Type"] = "application/json";
      }
    } catch (_) {}

    super.onRequest(options, handler);
  }
}
