import 'package:flutter/material.dart';
import 'package:show_time2/helper/constants.dart';
import 'package:show_time2/models/movie.dart';
import 'package:show_time2/models/movie_list.dart';
import 'package:show_time2/modules/error/error.dart';
import 'package:show_time2/modules/movie_list/movie_item/loading_item.dart';
import 'package:show_time2/modules/movie_list/movie_item/movie_item.dart';
import 'package:show_time2/network/network_calls.dart' as network;

class PopularMovies extends StatefulWidget {
  @override
  _PopularMoviesState createState() => new _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies>
    implements ActionButtonCallback {

  var movieCache = new List<Movie>();
  int currentPage = 1;
  int currentState = ViewState.LOADING;
  bool isFetching = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: new Center(
          child: _setData()
      ),
    );
  }

  Widget _setData() {
    switch (currentState) {
      case ViewState.LOADING:
        _fetchMovieList(currentPage);
        return new CircularProgressIndicator();
      case ViewState.DATA:
        return _setList();
      default:
        return _setError();
    }
  }

  Widget _setList() {
    return new ListView.builder(
      key: new Key(Keys.POPULAR_MOVIES),
      itemCount: movieCache.length + 1,
      itemBuilder: (BuildContext context, int index) =>
      index < movieCache.length
          ? _itemBuilder(index)
          : _loadingBuilder(),
    );
  }

  Widget _itemBuilder(int index) {
    if (!isFetching && index >= movieCache.length - 5) {
      currentPage++;
      _fetchMovieList(currentPage);
    }
    return new MovieItem(movie: movieCache[index]);
  }

  Widget _loadingBuilder() {
    return new LoadingItem();
  }

  _fetchMovieList(int page) async {
    isFetching = true;
    network.fetchPopularMovies(page).then((data) {
      setSuccessState(data);
    }).catchError((e) {
      setErrorState();
    });
  }

  void setSuccessState(MovieList data) {
    setState(() {
      isFetching = false;
      currentState = ViewState.DATA;
      movieCache.addAll(data.movieList);
    });
  }

  void setErrorState() {
    setState(() {
      isFetching = false;
      currentState = ViewState.ERROR;
    });
  }

  Widget _setError() {
    return new ErrorView(
      "http://icons.iconarchive.com/icons/paomedia/small-n-flat/1024/sign-error-icon.png",
      "Snap!",
      "There seems to be some sort of a network error",
      true,
      Icons.replay,
      this,
    );
  }

  @override
  actionClicked() {
    _fetchMovieList(0);
  }
}

