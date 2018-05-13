import 'package:flutter/material.dart';
import 'package:show_time2/modules/movie_list/movie_item/movie_item.dart';

class LoadingItem extends StatefulWidget implements ListItem {
  @override
  _LoadingItemState createState() => new _LoadingItemState();
}

class _LoadingItemState extends State<LoadingItem> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
