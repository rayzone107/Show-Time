import 'package:flutter/material.dart';
import 'package:show_time2/modules/movie_list/tab_data/now_playing_movies.dart';
import 'package:show_time2/modules/movie_list/tab_data/popular_movies.dart';
import 'package:show_time2/modules/movie_list/tab_data/top_rated_movies.dart';
import 'package:show_time2/modules/movie_list/tab_data/upcoming_movies.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => new _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 4,
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text("Popular Movies"),
              bottom: new TabBar(
                  tabs: [
                    new Tab(
                      text: "Popular",
                    ),
                    new Tab(
                      text: "Top Rated",
                    ),
                    new Tab(
                      text: "Now Playing",
                    ),
                    new Tab(
                      text: "Upcoming",
                    ),
                  ]
              ),
            ),
            body: new TabBarView(children: [
              new PopularMovies(),
              new TopRatedMovies(),
              new NowPlayingMovies(),
              new UpcomingMovies(),
            ])
        ),
      ),
    );
  }
}