import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _loadingScaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Scaffold(
        key: _loadingScaffoldKey,
        appBar: new AppBar(
          title: new Text('Loading Route Widget'),
        ),
        body: new Container(
          child: new Center(
            child: new Text('loading...'),
          ),
        ),
      ),
    );
  }
}
