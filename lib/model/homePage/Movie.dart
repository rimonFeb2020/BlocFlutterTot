class Movie {
  final String title;
  final String posterPath;
  final String overview;

  Movie(this.title, this.posterPath, this.overview);

  Movie.fromJson(Map json)
      : title = json['title'],
        posterPath = json['poster_path'],
        overview = json["overview"];


}