import 'dart:convert';

class Movie {
  String title;
  String posterURL;
  String overview;
  String id;
  Movie(
      {required this.title,
      required this.posterURL,
      required this.overview,
      required this.id});
  factory Movie.fromJson(json) {
    String posterPath = json['poster_path'];
    return Movie(
        title: json['title'],
        posterURL: ("https://image.tmdb.org/t/p/w500/${posterPath}"),
        overview: json['overview'],
        id: json['id'].toString());
  }
}
