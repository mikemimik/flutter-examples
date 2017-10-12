import 'package:flutter_flux/flutter_flux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../utils.dart';

// AUTH ACTIONS
final Action<String> setAuthEmailAction = new Action<String>();
final Action<String> setAuthPasswordAction = new Action<String>();
final Action<FirebaseAuth> setAuthControllerAction = new Action<FirebaseAuth>();
final Action<FirebaseUser> setUserAction = new Action<FirebaseUser>();

// LOCAL ACTIONS
final Action<Future<SharedPreferences>> setLocalControllerAction =
    new Action<Future<SharedPreferences>>();

// VIEW ACTIONS
final Action<ViewState> setCurrentViewAction = new Action<ViewState>();
