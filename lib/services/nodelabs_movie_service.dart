import 'package:case_study_movies_project/models/movie_model.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';

class NodeLabsMovieService extends IMovieService {
  @override
  Future<List<MovieModel>> getFavoriteMovies() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getMovies({int page = 1}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> toggleFavorite(String favoriteId) {
    throw UnimplementedError();
  }
}
