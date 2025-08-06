import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final IMovieService movieService;

  MovieBloc({required this.movieService}) : super(MovieState.initial()) {
    on<GetMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));
      try {
        final movies = await movieService.getMovies(page: event.page);
        emit(state.copyWith(status: MovieStatus.loaded, allMovies: movies));
      } catch (e) {
        emit(state.copyWith(
          status: MovieStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<GetFavoriteMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));
      try {
        final favorites = await movieService.getFavoriteMovies();
        emit(state.copyWith(
            status: MovieStatus.loaded, favoriteMovies: favorites));
      } catch (e) {
        emit(state.copyWith(
          status: MovieStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<ToggleFavoriteMovieEvent>((event, emit) async {
      try {
        final success = await movieService.toggleFavorite(event.movieId);
        if (success) {
          final updatedFavorites = await movieService.getFavoriteMovies();

          emit(
            state.copyWith(
              status: MovieStatus.loaded,
              favoriteMovies: updatedFavorites,
              allMovies: state.allMovies,
            ),
          );
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
    });
  }
}
