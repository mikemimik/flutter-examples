import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flux/flutter_flux.dart';

class AppBase extends StoreWatcher {
  AppBase();

  static final GlobalKey<ScaffoldState> _baseScaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  void initStores(ListenToStore listenToStore) {}

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    return new Scaffold(
      key: _baseScaffoldKey,
      appBar: new AppBar(
        title: new Text('Base Route Widget'),
      ),
      body: new Container(
        child: new Center(
          child: new Text('logged in'),
        ),
      ),
    );
  }
}
