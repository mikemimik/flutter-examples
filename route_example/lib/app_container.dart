import 'package:flutter/material.dart';
import 'routes/index.dart' as Routes;
import 'app_root.dart';

final AppBar mainAppBar = new AppBar(
  title: new Text('Route Example')
);

final ThemeData mainTheme = new ThemeData(
  primarySwatch: Colors.blue
);

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => new _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {

  final Map<String, WidgetBuilder> _kAppRoutes = new Map<String, WidgetBuilder>.fromIterable(
    Routes.kAllAppRouteItems,
    key: (Routes.AppRouteItem item) => item.routeName,
    value: (Routes.AppRouteItem item) => item.buildRoute
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Route Example',
      color: Colors.grey[500],
      theme: mainTheme,
      routes: _kAppRoutes,
      home: new AppRoot()
    );
  }
}