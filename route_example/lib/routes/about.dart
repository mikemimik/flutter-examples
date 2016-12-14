import 'package:flutter/material.dart';

class AboutRoute extends StatefulWidget {
  static const String routeName = '/about';
  @override
  _AboutRouteState createState() => new _AboutRouteState();
}

class _AboutRouteState extends State<AboutRoute> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Widget aboutRoute = new Center(
      child: new Container(
        child: new Text('About Route')
      )
    );

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('About Route')
      ),
      body: aboutRoute
    );
  }
}