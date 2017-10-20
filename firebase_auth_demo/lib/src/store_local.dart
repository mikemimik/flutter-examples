import 'package:flutter_flux/flutter_flux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../utils.dart';

class LocalStore extends Store {
  LocalStore() {
    triggerOnAction(setLocalControllerAction,
        (Future<SharedPreferences> pref) async {
      _pref = await pref;
    });
  }

  SharedPreferences _pref;

  SharedPreferences get pref => _pref;
}

final StoreToken localStoreToken = new StoreToken(new LocalStore());
