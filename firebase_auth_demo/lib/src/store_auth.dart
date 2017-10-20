import 'package:flutter_flux/flutter_flux.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils.dart';

class AuthStore extends Store {
  AuthStore() {
    triggerOnAction(setAuthControllerAction, (FirebaseAuth auth) {
      _auth = auth;
    });

    triggerOnAction(setAuthEmailAction, (String value) {
      _email = value;
    });

    triggerOnAction(setAuthPasswordAction, (String value) {
      _password = value;
    });

    triggerOnAction(setUserAction, (FirebaseUser user) {
      _user = user;
      _isAuthed = true;
    });
  }

  bool _isAuthed = false;
  String _email;
  String _password;
  FirebaseUser _user;
  FirebaseAuth _auth;

  bool get isAuthed => _isAuthed;
  String get email => _email;
  String get password => _password;
  FirebaseAuth get auth => _auth;
  FirebaseUser get user => _user;
}

final StoreToken authStoreToken = new StoreToken(new AuthStore());
