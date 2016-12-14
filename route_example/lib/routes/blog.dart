import 'package:flutter/material.dart';

class BlogRoute extends StatefulWidget {
  static const String routeName = '/blog';
  @override
  _BlogRouteState createState() => new _BlogRouteState();
}

class _BlogRouteState extends State<BlogRoute> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Widget blogRoute = new Center(
      child: new Container(
        child: new Text('Blog Route')
      )
    );

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Blog Route')
      ),
      body: blogRoute
    );
  }
}