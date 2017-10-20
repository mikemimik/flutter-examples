import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'src/routes/base.dart';
import 'src/routes/loading.dart';
import 'src/routes/login.dart';
import 'app_home.dart';

import 'utils.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

final Map<String, WidgetBuilder> _kAppRoutes = {
  '/': (BuildContext context) => new AppBase(),
  '/login': (BuildContext context) => new Login(auth: _auth),
  '/loading': (BuildContext context) => new Loading(),
};

class AppContainer extends StoreWatcher {
  AppContainer();

  Future<bool> _getAuthStatus() async {
    print('TESTING: beginning');
    SharedPreferences pref = await _prefs;
    String email = pref.getString('user.email');
    String password = pref.getString('user.password');
    print('email: $email, password: $password');
    if (email != null && password != null) {
      FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        setUserAction(user);
        setCurrentViewAction(ViewState.main);
        return true;
      }
    }
    print('returning /false/');
    setCurrentViewAction(ViewState.login);
    return false;
  }

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(viewStoreToken);

    setAuthControllerAction(_auth);
    setLocalControllerAction(_prefs);
    _getAuthStatus();
  }

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    final ViewStore viewStore = stores[viewStoreToken];
    switch (viewStore.currentView) {
      case ViewState.login:
        return new MaterialApp(
          title: 'Login Flow',
          home: new Login(
            auth: _auth,
          ),
        );
      case ViewState.main:
        return new AppHome(
          initialRoute: '/',
          routes: _kAppRoutes,
        );
      default:
        return new MaterialApp(
          title: 'Loading',
          home: new Scaffold(
            body: new Center(
              child: new Text('something went wrong'),
            ),
          ),
        );
    }
    // return new MaterialApp(
    //   title: 'App Container',
    //   home: new FutureBuilder(
    //     future: _getAuthStatus(),
    //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    //       print('snapshot: $snapshot');
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.none:
    //           print('nothing');
    //           return new Loading();
    //         case ConnectionState.waiting:
    //           print('loading...');
    //           return new Loading();
    //         case ConnectionState.done:
    //           print('TESTING: done');
    //           print('snapshot: ${snapshot.data}');
    //           return new AppHome(
    //             initialRoute: (snapshot.data) ? '/' : '/login',
    //             routes: _kAppRoutes,
    //           );
    //         default:
    //           if (snapshot.hasError) {
    //             print('Error: ${snapshot.error}');
    //           } else {
    //             print('Result: ${snapshot.data}');
    //           }
    //       }
    //     },
    //   ),
    // );
  }
}
