import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {

  final String iconURL;
  final String title;
  final String message;
  final bool showButton;
  final IconData buttonIcon;
  final ActionButtonCallback retryButtonCallback;

  ErrorView(this.iconURL, this.title, this.message, this.showButton,
      this.buttonIcon, this.retryButtonCallback);

  @override
  _ErrorViewState createState() => new _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.grey[100],
        child: new Stack(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(top: 80.0),
                    child: new Image.network(
                      widget.iconURL,
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(
                        top: 40.0, left: 60.0, right: 60.0, bottom: 10.0),
                    child: new Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: new Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 24.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(20.0),
              child: new Align(
                alignment: Alignment.bottomRight,
                child: new Container(
                  child: new FloatingActionButton(
                      child: new Icon(
                        widget.buttonIcon,
                        color: Colors.white,
                      ),
                      onPressed: _actionClicked,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

  void _actionClicked() {
    widget.retryButtonCallback.actionClicked();
  }
}

abstract class ActionButtonCallback {
  actionClicked();
}


