import 'package:flutter/material.dart';
import '../../models/movies_model.dart';
import '../../screens/movie_details_screen.dart';
import '../../service/init_getit.dart';
import '../../service/navigation_service.dart';
import '../cached_image.dart';
import 'favorite_btn.dart';
import 'genres_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key, required this.movieModel});

  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            getIt<NavigationService>().navigate(MovieDetailsScreen(movieModel: movieModel ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: movieModel.id ?? 'movieHero',
                  child: CachedImage(
                    imageUrl: "https://image.tmdb.org/t/p/w500/${movieModel.backdropPath}" ?? "https://i.ibb.co/FwTPCCc/Ultra-Linx.jpg",
                    height: 120,
                    width: 100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.title ?? 'No title available',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 5),
                          Text("${movieModel.voteAverage?.toStringAsFixed(1)}/10"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      GenresListWidget(movieModel: movieModel,),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.timer, color: Colors.blue, size: 18),
                          SizedBox(width: 5),
                          Text(movieModel.releaseDate ?? 'No release date available'),
                          Spacer(),
                          FavoriteBtnWidget(movieModel: movieModel,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
