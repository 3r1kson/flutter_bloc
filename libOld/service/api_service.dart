import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../constants/api_contants.dart';
import '../models/movies_genre_model.dart';
import '../models/movies_model.dart';

class ApiService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    log("Fetching movies from API, page: $page");
    final url = Uri.parse('${ApiContants.baseUrl}/movie/popular?language=pt-BR&page=$page');
    final response = await http.get(url, headers: ApiContants.headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<MovieModel>.from(data['results'].map((item) => MovieModel.fromJson(item)));

    } else {
      throw Exception("Failed to load movies: ${response.statusCode} - ${response.reasonPhrase}");
    }
  }

    Future<List<MoviesGenreModel>> fetchGenres() async {
    final url = Uri.parse('${ApiContants.baseUrl}/genre/movie/list?language=pt');
    final response = await http.get(url, headers: ApiContants.headers);

    log(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<MoviesGenreModel>.from(data['genres'].map((item) => MoviesGenreModel.fromJson(item)));

    } else {
      throw Exception("Failed to load movies: ${response.statusCode} - ${response.reasonPhrase}");
    }
  }
}