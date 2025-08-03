import 'dart:developer';

import '../models/movies_genre_model.dart';
import '../repository/movies_repository.dart';
import '../service/init_getit.dart';

class GenreUtils {
  static List<MoviesGenreModel> movieGenreNames(List<int> genreIds) {
    final moviesRepository = getIt<MoviesRepository>();
    final cachedGenres = moviesRepository.cachedGenres;
    List<MoviesGenreModel> genreNames = [];
    for (var genreId in genreIds) {
      log(genreId.toString());
      log(cachedGenres.toString());
      var genre = cachedGenres.firstWhere((g) => g.id == genreId, 
        orElse: () => MoviesGenreModel(id: 5448484, name: 'Unknown')
      );
      genreNames.add(genre);
    }
    return genreNames;
  }
}