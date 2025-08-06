abstract class MovieEvent {}

class GetMoviesEvent extends MovieEvent {
  final int page;
  GetMoviesEvent({this.page = 1});
}

class GetFavoriteMoviesEvent extends MovieEvent {}

class ToggleFavoriteMovieEvent extends MovieEvent {
  final String movieId;

  ToggleFavoriteMovieEvent({required this.movieId});
}
