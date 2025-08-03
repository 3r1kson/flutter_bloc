class MovieModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

   
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult : json['adult'],
      backdropPath : json['backdrop_path'],
      genreIds : json['genre_ids'].cast<int>(),
      id : json['id'],
      originalLanguage : json['original_language'],
      originalTitle : json['original_title'],
      overview : json['overview'],
      popularity : json['popularity'],
      posterPath : json['poster_path'],
      releaseDate : json['release_date'],
      title : json['title'],
      video : json['video'],
      voteAverage : json['vote_average'],
      voteCount : json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': this.adult,
      'backdrop_path': this.backdropPath,
      'genre_ids': this.genreIds,
      'id': this.id,
      'original_language': this.originalLanguage,
      'original_title': this.originalTitle,
      'overview': this.overview,
      'popularity': this.popularity,
      'poster_path': this.posterPath,
      'release_date': this.releaseDate,
      'title': this.title,
      'video': this.video,
      'vote_average': this.voteAverage,
      'vote_count': this.voteCount
    };
  }

  @override
  String toString() {
    return "MovieModel(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)";
  }
}