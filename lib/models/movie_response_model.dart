import 'package:case_study_movies_project/models/movie_model.dart';

/// API JSON Response Model for Paginated Movies List (5)
class MoviesListResponseModel {
  final List<MovieModel> movies;
  final int totalPages;
  final int currentPage;

  MoviesListResponseModel({
    required this.movies,
    required this.totalPages,
    required this.currentPage,
  });

  factory MoviesListResponseModel.fromMap(Map<String, dynamic> map) {
    final data = map['data'] ?? {};
    return MoviesListResponseModel(
      movies: (data['movies'] as List<dynamic>?)
              ?.map((x) => MovieModel.fromMap(x))
              .toList() ??
          [],
      totalPages: data['totalPages'] ?? 1,
      currentPage: data['currentPage'] ?? 1,
    );
  }

  Map<String, dynamic> toMap() => {
        'movies': movies.map((x) => x.toMap()).toList(),
        'totalPages': totalPages,
        'currentPage': currentPage,
      };
}

/// API JSON Response Model for Favorite Movies List
class FavoriteMoviesResponseModel {
  final List<MovieModel> movies;

  FavoriteMoviesResponseModel({required this.movies});

  factory FavoriteMoviesResponseModel.fromMap(Map<String, dynamic> map) {
    return FavoriteMoviesResponseModel(
      movies: (map['data'] as List<dynamic>?)
              ?.map((x) => MovieModel.fromMap(x))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() =>
      {'movies': movies.map((x) => x.toMap()).toList()};
}

/// API JSON Response Model for Toggling Favorite Status of Movies
class ToggleFavoriteResponseModel {
  final bool success;
  final String message;

  ToggleFavoriteResponseModel({required this.success, required this.message});

  factory ToggleFavoriteResponseModel.fromMap(Map<String, dynamic> map) {
    final response = map['response'] ?? {};
    return ToggleFavoriteResponseModel(
      success: (response['code'] ?? 0) == 200,
      message: response['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {'success': success, 'message': message};
}
