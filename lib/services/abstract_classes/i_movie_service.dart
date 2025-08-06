import 'package:case_study_movies_project/models/movie_model.dart';

abstract class IMovieService {
  Future<List<MovieModel>> getMovies({int page = 1});
  Future<List<MovieModel>> getFavoriteMovies();
  Future<bool> toggleFavorite(String favoriteId);
}
