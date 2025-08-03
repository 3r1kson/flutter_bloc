import 'package:flutter/material.dart';
import '../../constants/my_app_constants.dart';
import '../../models/movies_genre_model.dart';
import '../../models/movies_model.dart';
import '../../utils/genre_utils.dart';

class GenresListWidget extends StatelessWidget{
  const GenresListWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    List<MoviesGenreModel> moviesGenres = GenreUtils.movieGenreNames(movieModel.genreIds ?? []);
    return Wrap(
      children: List.generate(moviesGenres.length, (index) => chipWidget(genreName: moviesGenres[index].name ?? '', context: context))
    );
  }

  Widget chipWidget({
    required String genreName,
    required BuildContext context
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          border: Border.all(color: Theme.of(context).colorScheme.surface)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface, fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}