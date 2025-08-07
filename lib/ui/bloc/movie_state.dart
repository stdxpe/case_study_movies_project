import 'package:case_study_movies_project/models/movie_model.dart';

enum MovieStatus { initial, loading, loadingMore, loaded, error }

class MovieState {
  final MovieStatus status;
  final List<MovieModel> allMovies;
  final List<MovieModel> favoriteMovies;
  final int currentPage;
  final String? errorMessage;

  const MovieState({
    required this.status,
    required this.allMovies,
    required this.favoriteMovies,
    required this.currentPage,
    this.errorMessage,
  });

  factory MovieState.initial() => const MovieState(
        status: MovieStatus.initial,
        allMovies: [],
        favoriteMovies: [],
        currentPage: 1,
      );

  MovieState copyWith({
    MovieStatus? status,
    List<MovieModel>? allMovies,
    List<MovieModel>? favoriteMovies,
    int? currentPage,
    String? errorMessage,
  }) {
    return MovieState(
      status: status ?? this.status,
      allMovies: allMovies ?? this.allMovies,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      currentPage: currentPage ?? this.currentPage,
      errorMessage: errorMessage,
    );
  }

  bool isLiked(String movieId) {
    return favoriteMovies.any((fav) => fav.id == movieId);
  }
}
