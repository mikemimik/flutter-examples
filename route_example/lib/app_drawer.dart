import 'package:flutter/material.dart';
import 'routes/index.dart' as Routes;

class _AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DrawerHeader(
      child: new FlutterLogo()
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> allDrawerItems = new List<Widget>();

    allDrawerItems.add(new _AppDrawerHeader());

    for (Routes.AppRouteItem routeItem in Routes.kAllAppRouteItems) {
      allDrawerItems.add(routeItem);
    }

    return new Drawer(
      child: new Block(
        children: allDrawerItems
      )
    );
  }
}