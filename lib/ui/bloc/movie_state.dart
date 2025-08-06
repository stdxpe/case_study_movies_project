import 'package:case_study_movies_project/models/movie_model.dart';

enum MovieStatus {
  initial,
  loading,
  loaded,
  favoriteToggled,
  error,
}

class MovieState {
  final MovieStatus status;
  final List<MovieModel> movies;
  final List<MovieModel> favoriteMovies;
  final String? errorMessage;

  const MovieState({
    required this.status,
    required this.movies,
    required this.favoriteMovies,
    this.errorMessage,
  });

  factory MovieState.initial() => const MovieState(
        status: MovieStatus.initial,
        movies: [],
        favoriteMovies: [],
      );

  MovieState copyWith({
    MovieStatus? status,
    List<MovieModel>? movies,
    List<MovieModel>? favoriteMovies,
    String? errorMessage,
  }) {
    return MovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      errorMessage: errorMessage,
    );
  }
}
