import 'dart:convert';

import 'package:ghulk/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MovieAPI {
  final String _apiKey = 'f29a7b6d43d6e1c39648dbe88585b82e';
  final String _baseURL = 'https://api.themoviedb.org';

  Future<List<Movie>> getPop() async {
    final Response response = await http.get(Uri.parse(
        '$_baseURL/3/movie/popular?api_key=$_apiKey&language=en-US&page=1'));
    List<Movie> moviesList = [];
    if (response.statusCode == 200) {
      final moviesJSONVal = jsonDecode(response.body);
      for (var movie in moviesJSONVal["results"]) {
        print(movie);
        moviesList.add(Movie.fromJson(movie));
      }
    }
    return moviesList;
  }

  Future<List<Movie>> getTop() async {
    final Response response = await http.get(Uri.parse(
        '$_baseURL/3/movie/top_rated?api_key=$_apiKey&language=en-US&page=1'));
    List<Movie> moviesList = [];
    if (response.statusCode == 200) {
      final moviesJSONVal = jsonDecode(response.body);
      for (var movie in moviesJSONVal["results"]) {
        print(movie);
        moviesList.add(Movie.fromJson(movie));
      }
    }
    return moviesList;
  }

  Future<List<Movie>> getNew() async {
    final Response response = await http.get(Uri.parse(
        '$_baseURL/3/movie/upcoming?api_key=$_apiKey&language=en-US&page=1'));
    List<Movie> moviesList = [];
    if (response.statusCode == 200) {
      final moviesJSONVal = jsonDecode(response.body);
      for (var movie in moviesJSONVal["results"]) {
        print(movie);
        moviesList.add(Movie.fromJson(movie));
      }
    }
    return moviesList;
  }

  Future<List<Movie>> getNow() async {
    final Response response = await http.get(Uri.parse(
        '$_baseURL/3/movie/now_playing?api_key=$_apiKey&language=en-US&page=1'));
    List<Movie> moviesList = [];
    if (response.statusCode == 200) {
      final moviesJSONVal = jsonDecode(response.body);
      for (var movie in moviesJSONVal["results"]) {
        print(movie);
        moviesList.add(Movie.fromJson(movie));
      }
    }
    return moviesList;
  }

  Future<Response> _getResponse(String route) {
    return http
        .get(Uri.parse('$_baseURL/$route?apikey=$_apiKey&language=en-US'));
  }
}
