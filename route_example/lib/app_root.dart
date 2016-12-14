import 'package:flutter/material.dart';
import 'app_drawer.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => new _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Widget appRoot = new Container(
      child: new Center(
        child: new Text('Application Root')
      )
    );
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new AppDrawer(),
      appBar: new AppBar(
        title: new Text('AppRoot')
      ),
      body: appRoot
    );
  }
}