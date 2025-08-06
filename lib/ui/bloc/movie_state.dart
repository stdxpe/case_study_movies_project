import 'package:case_study_movies_project/models/movie_model.dart';

enum MovieStatus {
  initial,
  loading,
  loaded,
  error,
}

class MovieState {
  final MovieStatus status;
  final List<MovieModel> allMovies;
  final List<MovieModel> favoriteMovies;
  final String? errorMessage;

  const MovieState({
    required this.status,
    required this.allMovies,
    required this.favoriteMovies,
    this.errorMessage,
  });

  factory MovieState.initial() => const MovieState(
        status: MovieStatus.initial,
        allMovies: [],
        favoriteMovies: [],
      );

  MovieState copyWith({
    MovieStatus? status,
    List<MovieModel>? allMovies,
    List<MovieModel>? favoriteMovies,
    String? errorMessage,
  }) {
    return MovieState(
      status: status ?? this.status,
      allMovies: allMovies ?? this.allMovies,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      errorMessage: errorMessage,
    );
  }

  bool isLiked(String movieId) {
    return favoriteMovies.any((fav) => fav.id == movieId);
  }
}
