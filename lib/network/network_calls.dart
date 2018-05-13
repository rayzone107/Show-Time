import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:show_time2/models/movie.dart';
import 'package:show_time2/models/movie_list.dart';

const String API_KEY = "01ea1dda66905ea9cdd37c47b06e6591";
const String BASE_URL = "https://api.themoviedb.org/";
const String API_URL = "?api_key=" + API_KEY + "&language=en-US&";

String urlBuilder(String path) {
  return BASE_URL + path + API_URL;
}

String urlBuilderWithPage(String path, int page) {
  return BASE_URL + path + API_URL + "page=" + page.toString();
}

Future<List<Movie>> fetchPopularMovies(int page) async {
  List<Movie> movies = [];
  final response = await http.get(urlBuilderWithPage("3/movie/popular", page));
  final responseJson = json.decode(response.body);

  final moviesList = (responseJson['results'] as List).map((i) =>
  new Movie.fromJson(i));
  for (final movie in moviesList) {
    movies.add(movie);
  }

  return movies;
}

Future<MovieList> fetchPopularMovies2(int page) async {
  final response = await http.get(urlBuilderWithPage("3/movie/popular", page));
  return new MovieList.fromJson(json.decode(response.body));
}
