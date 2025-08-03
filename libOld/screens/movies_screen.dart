import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/movies_genre_model.dart';
import '../models/movies_model.dart';
import 'favorite_movies_screen.dart';
import '../service/api_service.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../widgets/movies/movies_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);
  
  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  final List<MovieModel> _movies = [];
  final ScrollController _scrollScontroller = ScrollController();
  int _currentPage = 1;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollScontroller.addListener(onScroll);
  }

  void onScroll() {
    if (_scrollScontroller.position.pixels == _scrollScontroller.position.maxScrollExtent && !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;
    setState(() {
      _isFetching = true;

    });
    try {
      final List<MovieModel> movies = await getIt<ApiService>().fetchMovies(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (e) {
      getIt<NavigationService>().showSnackBar(
        "Failed to load movies: $e"
      );
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollScontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(FavoriteMoviesScreen(movieModel: MovieModel(),));
            },
            icon: const Icon(Icons.favorite_rounded,
            color: Colors.red)
          ),
          IconButton(
            onPressed: () async {
              final List<MoviesGenreModel> movies = await getIt<ApiService>().fetchGenres();
            log("$movies");
            },
            icon: const Icon(Icons.dark_mode,
            color: Colors.black)
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollScontroller,
        itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _movies.length) {
            return MoviesWidget(movieModel: _movies[index],);
          } else {
            return Center(
              child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}