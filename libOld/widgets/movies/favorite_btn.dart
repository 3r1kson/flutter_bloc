import 'package:flutter/material.dart';
import '../../models/movies_model.dart';

class FavoriteBtnWidget extends StatefulWidget {
  const FavoriteBtnWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  State<FavoriteBtnWidget> createState() => _FavoriteBtnWidgetState();
}

class _FavoriteBtnWidgetState extends State<FavoriteBtnWidget> {
  final favoriteMovieIds = [];
  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteMovieIds.contains(widget.movieModel.id);
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          favoriteMovieIds.remove(widget.movieModel.id);
        } else {
          favoriteMovieIds.add(widget.movieModel.id);
        }
        setState(() {});
      }, 
      icon: Icon(
        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: Colors.red,
        size: 20
      )
    );
  }
}