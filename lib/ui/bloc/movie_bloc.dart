import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/ui/bloc/movie_event.dart';
import 'package:case_study_movies_project/ui/bloc/movie_state.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final IMovieService movieService;
  final _logger = locator<ILoggerService>();

  MovieBloc({required this.movieService}) : super(MovieState.initial()) {
    on<GetMoviesEvent>(_onGetMovies);
    on<GetFavoriteMoviesEvent>(_onGetFavoriteMovies);
    on<ToggleFavoriteMovieEvent>(_onToggleFavoriteMovie);
  }

  Future<void> _onGetMovies(
      GetMoviesEvent event, Emitter<MovieState> emit) async {
    _logger.logInfo('GetMovies started, page: ${event.page}');
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
      _logger.logInfo(
          'GetMovies successful, page: ${event.page}, new items: ${newMovies.length}');
    } catch (e, stack) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: e.toString(),
      ));
      _logger.logError('GetMovies failed, page: ${event.page}',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
    }
  }

  Future<void> _onGetFavoriteMovies(
    GetFavoriteMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    _logger.logInfo('GetFavoriteMovies started');
    emit(state.copyWith(status: MovieStatus.loading));

    try {
      final favorites = await movieService.getFavoriteMovies();
      emit(state.copyWith(
          status: MovieStatus.loaded, favoriteMovies: favorites));
      _logger
          .logInfo('GetFavoriteMovies successful, count: ${favorites.length}');
    } catch (e, stack) {
      emit(state.copyWith(
          status: MovieStatus.error, errorMessage: e.toString()));
      _logger.logError('GetFavoriteMovies failed',
          error: e is Exception ? e : Exception(e.toString()), stack: stack);
    }
  }

  Future<void> _onToggleFavoriteMovie(
    ToggleFavoriteMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    _logger
        .logInfo('ToggleFavoriteMovie started for movieId: ${event.movieId}');
    try {
      final success = await movieService.toggleFavorite(event.movieId);

      if (success) {
        final updatedFavorites = await movieService.getFavoriteMovies();

        emit(state.copyWith(
          status: MovieStatus.loaded,
          favoriteMovies: updatedFavorites,
          allMovies: state.allMovies,
        ));
        _logger.logInfo(
            'ToggleFavoriteMovie succeeded for movieId: ${event.movieId}');
      } else {
        emit(state.copyWith(
          status: MovieStatus.error,
          errorMessage: 'Failed to toggle favorite',
        ));
        _logger.logWarning(
            'ToggleFavoriteMovie failed for movieId: ${event.movieId}');
      }
    } catch (e, stack) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: e.toString(),
      ));
      _logger.logError(
          'ToggleFavoriteMovie error for movieId: ${event.movieId}',
          error: e is Exception ? e : Exception(e.toString()),
          stack: stack);
    }
  }
}
