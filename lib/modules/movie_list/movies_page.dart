import 'package:flutter/material.dart';
import 'package:show_time2/models/movie.dart';
import 'package:show_time2/modules/movie_list/movie_item/loading_item.dart';
import 'package:show_time2/modules/movie_list/movie_item/movie_item.dart';
import 'package:show_time2/network/network_calls.dart' as network;

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => new _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  var movieCache = new List<Movie>();
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Popular Movies"),
      ),
      body: new Container(
        color: Colors.grey[200],
        child: new Center(
            child: _fetchMovies()
        ),
      ),
    );
  }

  FutureBuilder<List<Movie>> _fetchMovies() {
    return new FutureBuilder(future: network.fetchPopularMovies(currentPage),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            movieCache.clear();
            movieCache.addAll(snapshot.data);
            return new ListView.builder(
              key: new Key("XYZ"),
              itemCount: movieCache.length + 1,
              itemBuilder: (BuildContext context, int index) =>
              index < movieCache.length
                  ? _itemBuilder(movieCache[index])
                  : _loadingBuilder(),
            );
          } else if (snapshot.hasError) {
            return new Text("Server Error");
          }
          return new CircularProgressIndicator();
        }
    );
  }

  Widget _itemBuilder(Movie movie) {
    return new MovieItem(movie: movie);
  }

  Widget _loadingBuilder() {
    return new LoadingItem();
  }
}