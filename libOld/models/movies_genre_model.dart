class MoviesGenreModel {
  int? id;
  String? name;

  MoviesGenreModel({
    this.id,
    this.name
  });

  factory MoviesGenreModel.fromJson(Map<String, dynamic> json) {
    return MoviesGenreModel(
      id: json['id'],
      name: json['name']
    );
  }

  @override
  String toString() {
    return 'MoviesGenreModel(id: $id, name: $name)';
  }
}