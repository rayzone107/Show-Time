import 'package:flutter/material.dart';
import 'package:show_time2/models/movie.dart';

class MovieDetail extends StatefulWidget {

  final Movie movie;

  MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailState createState() => new _MovieDetailState();

}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.movie.title),
      ),
    );
  }
}
