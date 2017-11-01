import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AppContainer extends StatelessWidget {
  AppContainer();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Firebase Auth Demo 2',
      home: new StoreConnector(
        converter: (store) {},
        builder: (context, data) {},
      ),
    );
  }
}
