import 'package:flutter_flux/flutter_flux.dart';

import '../utils.dart';

class ViewStore extends Store {
  ViewStore() {
    triggerOnAction(setCurrentViewAction, (ViewState view) {
      _currentView = view;
    });
  }

  ViewState _currentView;

  ViewState get currentView => _currentView;
}

final StoreToken viewStoreToken = new StoreToken(new ViewStore());
