
import 'package:mvvm_course/models/movies_genre.dart';

import '../repository/movies_repo.dart';
import '../service/init_getit.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenresNames(List<int> moviesGenresList, List<MoviesGenre> allGenresList) {
    List<MoviesGenre> genresNames = [];
    for (var genreId in moviesGenresList) {
      var genre = allGenresList.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenre(id: 5448484, name: 'Unknown'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
