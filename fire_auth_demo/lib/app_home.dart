import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_flux/flutter_flux.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';

// import 'src/routes/base.dart';
// import 'src/routes/loading.dart';
// import 'src/routes/login.dart';

// import 'utils.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// final Map<String, WidgetBuilder> _kAppRoutes = {
//   '/': (BuildContext context) => new AppBase(),
//   '/login': (BuildContext context) => new Login(),
//   '/loading': (BuildContext context) => new Loading(),
// };

class AppHome extends StatefulWidget {
  AppHome({
    @required this.initialRoute,
    @required this.routes,
  });

  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  @override
  _AppHomeState createState() => new _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  /* TODO:
   * - check local store for creds
   * -
   */
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Firebase Auth Demo',
      color: Colors.blue[500],
      theme: new ThemeData(primarySwatch: Colors.blue),
      routes: widget.routes,
      initialRoute: widget.initialRoute,
      // onGenerateRoute: _getRoute,
    );
  }
}
