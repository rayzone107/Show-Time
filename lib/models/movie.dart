class Movie {
  int id;
  String title;
  String overview;
  String releaseDate;
  String posterPath;
  int voteCount;
  var voteAverage;

  Movie(this.id, this.title, this.overview, this.releaseDate,
      this.posterPath, this.voteCount, this.voteAverage);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie(
      json['id'],
      json['title'],
      json['overview'],
      json["release_date"],
      json['poster_path'],
      json['vote_count'],
      json['vote_average'],
    );
  }
}