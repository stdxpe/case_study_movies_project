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
    return MoviesListResponseModel(
      movies: List<MovieModel>.from(
        (map['movies'] as List).map((x) => MovieModel.fromMap(x)),
      ),
      totalPages: map['totalPages'],
      currentPage: map['currentPage'],
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
      movies: List<MovieModel>.from(
        (map['movies'] as List).map((x) => MovieModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() => {
        'movies': movies.map((x) => x.toMap()).toList(),
      };
}

/// API JSON Response Model for Toggling Favorite Status of Movies
class ToggleFavoriteResponseModel {
  final bool success;
  final String message;

  ToggleFavoriteResponseModel({required this.success, required this.message});

  factory ToggleFavoriteResponseModel.fromMap(Map<String, dynamic> map) {
    return ToggleFavoriteResponseModel(
      success: map['success'],
      message: map['message'],
    );
  }

  Map<String, dynamic> toMap() => {'success': success, 'message': message};
}
