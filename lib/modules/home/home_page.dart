import 'package:flutter/material.dart';
import 'package:show_time2/modules/movie_list/movies_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Show Time"),
//        bottom: new TabBar(
//            tabs: [
//              new Tab(icon: new Image.network(src))
//            ]),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: _onPressed,
          child: new Text("Goto Movies"),
        ),
      ),
    );
  }

  void _onPressed() {
    Route route = new MaterialPageRoute(
      settings: new RouteSettings(name: "/movies"),
      builder: (BuildContext context) => new MoviesPage(),
    );
    Navigator.push(context, route);
  }
}