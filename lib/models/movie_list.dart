import 'package:show_time2/models/movie.dart';

class MovieList {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> movieList;

  MovieList(this.page, this.totalResults, this.totalPages, this.movieList);

  factory MovieList.fromJson(Map<String, dynamic> json) {
    return new MovieList(
      json['page'],
      json['total_results'],
      json['total_pages'],
      MovieList.getMovieList(json["results"]),
    );
  }

  static List<Movie> getMovieList(var json) {

    List<Movie> movies = [];

    final moviesList = (json as List).map((i) =>
    new Movie.fromJson(i));
    for (final movie in moviesList) {
      movies.add(movie);
    }
    return movies;
  }
}