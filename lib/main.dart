import 'package:flutter/material.dart';
import 'package:show_time2/modules/home/home_page.dart';
import 'package:show_time2/modules/movie_list/movies_page.dart';

void main() => runApp(new MyApp());

final ThemeData _themeData = new ThemeData(
  primarySwatch: Colors.amber,
  accentColor: Colors.lightBlueAccent,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Show Time",
      theme: _themeData,
      home: new HomePage(),
    );
  }
}


