
class PeliculasActorModel {
  final int id;
  final String title;
  final String? releaseDate;
  final String? posterPath;
  final String? character;

  PeliculasActorModel({
    required this.id,
    required this.title,
    this.releaseDate,
    this.posterPath,
    this.character,
  });

  factory PeliculasActorModel.fromJson(
      Map<String, dynamic> json) {

    return PeliculasActorModel(
      id: json['id'],
      title: json['title'] ?? 'Sin título',
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      character: json['character'],
    );
  }
}
