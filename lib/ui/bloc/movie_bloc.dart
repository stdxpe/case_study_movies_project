import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/abstract_classes/i_movie_service.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final IMovieService movieService;

  MovieBloc({required this.movieService}) : super(MovieState.initial()) {
    on<GetMoviesEvent>(_onGetMovies);
    on<GetFavoriteMoviesEvent>(_onGetFavoriteMovies);
    on<ToggleFavoriteMovieEvent>(_onToggleFavoriteMovie);
  }

  Future<void> _onGetMovies(
      GetMoviesEvent event, Emitter<MovieState> emit) async {
    if (event.page == 1) {
      emit(state.copyWith(
          status: MovieStatus.loading, allMovies: [], currentPage: 1));
    } else {
      emit(state.copyWith(status: MovieStatus.loadingMore));
    }

    try {
      final newMovies = await movieService.getMovies(page: event.page);
      final combinedMovies = [
        ...state.allMovies,
        ...newMovies,
      ];

      emit(state.copyWith(
        status: MovieStatus.loaded,
        allMovies: combinedMovies,
        currentPage: event.page,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onGetFavoriteMovies(
    GetFavoriteMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(status: MovieStatus.loading));

    try {
      final favorites = await movieService.getFavoriteMovies();
      emit(state.copyWith(
          status: MovieStatus.loaded, favoriteMovies: favorites));
    } catch (e) {
      emit(state.copyWith(
          status: MovieStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onToggleFavoriteMovie(
    ToggleFavoriteMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    try {
      final success = await movieService.toggleFavorite(event.movieId);

      if (success) {
        final updatedFavorites = await movieService.getFavoriteMovies();

        emit(state.copyWith(
          status: MovieStatus.loaded,
          favoriteMovies: updatedFavorites,
          allMovies: state.allMovies,
        ));
      } else {
        emit(state.copyWith(
          status: MovieStatus.error,
          errorMessage: 'Failed to toggle favorite',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
