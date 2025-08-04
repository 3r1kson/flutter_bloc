import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_course/models/movies_genre.dart';
import 'package:mvvm_course/models/movies_model.dart';
import 'package:mvvm_course/repository/movies_repo.dart';
import 'package:mvvm_course/service/init_getit.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMoviesEvent>(_onFetchMovies);
    on<FetchMoreMoviesEvent>(_onFetchMoreMovies);
  }

  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();

  Future<void> _onFetchMovies(event, emit) async {
    emit(MoviesLoadingState());
    try {
      var genres = await _moviesRepository.fetchGenres();
      // log("Genres $genres");
      var movies = await _moviesRepository.fetchMovies(page: 1); 
      emit(MoviesLoadedState(movies: movies, genres: genres, currentPage: 1));
    } catch (e) {
      emit(MoviesErrorState("Failed to fetch movies: $e"));
    }
  }

  Future<void> _onFetchMoreMovies(event, emit) async {
    final currentState = state;
    if (currentState is MoviesLoadingMoreState) {
      return;
    }
    if (currentState is! MoviesLoadedState) {
      return;
    }
    emit(MoviesLoadingMoreState(
      currentPage: currentState.currentPage,
      genres: currentState.genres,
      movies: currentState.movies
    ));

    try {
      List<MovieModel> movies = await _moviesRepository.fetchMovies(page: currentState.currentPage + 1);
      if (movies.isEmpty) {
        emit(currentState);
        return;
      }
      currentState.movies.addAll(movies);
      emit(MoviesLoadedState(
        movies: currentState.movies, 
        genres: currentState.genres,
        currentPage: currentState.currentPage + 1
      ));
    } catch (e) {
      emit(MoviesErrorState("Failed to fetch movies: $e"));
    }
    
  }
}
