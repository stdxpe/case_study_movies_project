import 'package:dio/dio.dart';

import 'package:case_study_movies_project/models/movie_model.dart';
import 'package:case_study_movies_project/utilities/k_endpoints.dart';
import 'package:case_study_movies_project/models/movie_response_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class NodeLabsMovieService extends IMovieService {
  final _dio = locator<Dio>();
  final _logger = locator<ILoggerService>();

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    const String endpoint = ApiEndpoints.favorites;

    try {
      _logger.logInfo('GET $endpoint → Fetching items');
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        final favMoviesResponse =
            FavoriteMoviesResponseModel.fromMap(response.data);

        _logger.logInfo(
            'Successfully fetched ${favMoviesResponse.movies.length} items from $endpoint');

        return favMoviesResponse.movies;
      } else if (response.statusCode == 401) {
        _logger.logError(
            'GET $endpoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'GET $endpoint → ${AppStrings.errors.unknown}: ${response.statusCode}');

        throw Exception('${AppStrings.errors.unknown}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      _logger.logError('GET $endpoint → Exception: $error $stacktrace');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getMovies({int page = 1}) async {
    const String endpoint = ApiEndpoints.movies;

    try {
      _logger.logInfo('GET $endpoint → Fetching items for page: $page');
      final response =
          await _dio.get(endpoint, queryParameters: {'page': page});

      if (response.statusCode == 200) {
        final moviesListResponse =
            MoviesListResponseModel.fromMap(response.data);

        _logger.logInfo(
            'Successfully fetched ${moviesListResponse.movies.length} items from $endpoint for page: $page');
        return moviesListResponse.movies;
      } else if (response.statusCode == 401) {
        _logger.logError(
            'GET $endpoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else {
        _logger.logError(
            'GET $endpoint → ${AppStrings.errors.unknown}: ${response.statusCode}');

        throw Exception('${AppStrings.errors.unknown}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      _logger.logError('GET $endpoint → Exception: $error $stacktrace');
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(String favoriteId) async {
    final String endpoint = "${ApiEndpoints.favoriteWithId}$favoriteId";

    try {
      _logger.logInfo('POST $endpoint → Toggling $favoriteId');
      final response = await _dio.post(endpoint);

      if (response.statusCode == 200) {
        _logger.logInfo('Successfully toggled $favoriteId from $endpoint');

        final toggleResponse =
            ToggleFavoriteResponseModel.fromMap(response.data);
        return toggleResponse.success;
      } else if (response.statusCode == 401) {
        _logger.logError(
            'POST $endpoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.unauthorized401}: ${response.statusCode}');
      } else if (response.statusCode == 404) {
        _logger.logError(
            'POST $endpoint → ${AppStrings.errors.movieNotFound404} for $favoriteId: ${response.statusCode}');

        throw Exception(
            '${AppStrings.errors.movieNotFound404}: ${response.statusCode}');
      } else {
        _logger.logError(
            'POST $endpoint → ${AppStrings.errors.unknown}: ${response.statusCode}');
        throw Exception('${AppStrings.errors.unknown}: ${response.statusCode}');
      }
    } on DioException catch (error, stacktrace) {
      _logger.logError('POST $endpoint → Exception: $error $stacktrace');
      rethrow;
    }
  }
}
