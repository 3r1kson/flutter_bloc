import 'dart:developer';

import '../models/movies_genre_model.dart';
import '../models/movies_model.dart';
import '../service/api_service.dart';

class MoviesRepository {
  final ApiService _apiService;
  MoviesRepository(this._apiService);
  List<MoviesGenreModel> cachedGenres = [];

  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  Future<List<MoviesGenreModel>> fetchGenres() async {
    return cachedGenres = await _apiService.fetchGenres();
  }
}