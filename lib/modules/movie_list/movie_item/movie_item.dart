import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:show_time2/models/movie.dart';
import 'package:show_time2/modules/detail/movie_detail.dart';

abstract class ListItem {}

class MovieItem extends StatefulWidget implements ListItem {

  final Movie movie;

  MovieItem({Key key, this.movie}) : super(key: key);

  @override
  _MovieItemState createState() => new _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {

  final TextStyle labelStyle = new TextStyle(
    color: Colors.grey[500],
  );

  DateFormat df = new DateFormat.yMMMMd("en_US");

  bool isReleased = true;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _onTap,
      child: new Card(
        elevation: 1.0,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 15.0),
              width: 100.0,
              height: 150.0,
              child: new Image.network(
                  "https://image.tmdb.org/t/p/w500" +
                      widget.movie.posterPath),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          margin: const EdgeInsets.only(
                              top: 12.0, bottom: 10.0),
                          child: new Text(widget.movie.title,
                            style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 12.0, right: 10.0),
                        child: new Text(
                          widget.movie.voteAverage.toStringAsFixed(1),
                          style: new TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: new Text(widget.movie.overview,
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: new Row(
                      children: <Widget>[
                        new Text(isReleased ? "RELEASED" : "RELEASING",
                          style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
                          ),
                        ),
                        new Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: _setDate()
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    Route route = new MaterialPageRoute(
      settings: new RouteSettings(name: "/movies/detail"),
      builder: (BuildContext context) => new MovieDetail(movie: widget.movie),
    );
    Navigator.push(context, route);
  }

  Widget _setDate() {
    String date = widget.movie.releaseDate;
    DateTime dateTime = DateTime.parse(date);
    setState(() {
      isReleased = dateTime.isBefore(new DateTime.now());
    });
    return new Text(df.format(dateTime));
  }
}


