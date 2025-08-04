part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();
  
  @override
  List<Object> get props => [];
}

final class MoviesInitial extends MoviesState {}

final class MoviesLoadingState extends MoviesState {}

final class MoviesLoadedState extends MoviesState {
  final List<MovieModel> movies;
  final List<MoviesGenre> genres;
  final int currentPage;

  const MoviesLoadedState({
    this.movies = const [],
    this.genres = const [],
    this.currentPage = 0
  });
}

final class MoviesLoadingMoreState extends MoviesState {
  final List<MovieModel> movies;
  final List<MoviesGenre> genres;
  final int currentPage;

  const MoviesLoadingMoreState({
    this.movies = const [],
    this.genres = const [],
    this.currentPage = 0
  });
}

final class MoviesErrorState extends MoviesState {
  final String message;

  const MoviesErrorState(this.message);
}
