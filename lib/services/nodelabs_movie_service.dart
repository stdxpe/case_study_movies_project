import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/movie_model.dart';
import 'package:case_study_movies_project/models/movie_response_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class NodeLabsMovieService extends IMovieService {
  final Dio _dio = locator<Dio>();

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    const String endPoint = '/movie/favorites';

    try {
      final response = await _dio.get(endPoint);

      if (response.statusCode == 200) {
        final favMoviesResponse =
            FavoriteMoviesResponseModel.fromMap(response.data);
        return favMoviesResponse.movies;
      } else if (response.statusCode == 401) {
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        throw Exception('${AppStrings.errors.unknown}: ${response.statusCode}');
      }
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getMovies({int page = 1}) async {
    const String endPoint = '/movie/list';
    try {
      final response =
          await _dio.get(endPoint, queryParameters: {'page': page});

      if (response.statusCode == 200) {
        final moviesListResponse =
            MoviesListResponseModel.fromMap(response.data);
        return moviesListResponse.movies;
      } else if (response.statusCode == 401) {
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        throw Exception('${AppStrings.errors.unknown}: ${response.statusCode}');
      }
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(String favoriteId) async {
    final String endPoint = '/movie/favorite/$favoriteId';
    try {
      final response = await _dio.post(endPoint);

      if (response.statusCode == 200) {
        final toggleResponse =
            ToggleFavoriteResponseModel.fromMap(response.data);
        return toggleResponse.success;
      } else if (response.statusCode == 401) {
        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else if (response.statusCode == 404) {
        throw Exception(
            '${AppStrings.errors.movieNotFound404}: ${response.statusCode}');
      } else {
        throw Exception('${AppStrings.errors.unknown}: ${response.statusCode}');
      }
    } on DioException catch (_) {
      rethrow;
    }
  }
}
