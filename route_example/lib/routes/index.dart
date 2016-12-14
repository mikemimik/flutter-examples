import 'package:flutter/material.dart';
import 'all.dart';

class AppRouteItem extends StatelessWidget {
  AppRouteItem({
    String this.title,
    String this.subtitle,
    String this.category: 'Component',
    IconData this.iconType,
    String this.routeName,
    WidgetBuilder this.buildRoute
  });

  final String title;
  final String subtitle;
  final String category;
  final IconData iconType;
  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  Widget build(BuildContext context) {
    Widget routeItem = new DrawerItem(
      icon: new Icon(iconType),
      onPressed: () {
        if (routeName != null) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(routeName);
        }
      },
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Text(title))
        ]
      )
    );
    return routeItem;
  }
}

final List<AppRouteItem> kAllAppRouteItems = <AppRouteItem>[
  new AppRouteItem(
    title: 'Blog',
    subtitle: 'Blog Route',
    category: 'route',
    iconType: Icons.format_quote,
    routeName: BlogRoute.routeName,
    buildRoute: (BuildContext context) => new BlogRoute()
  ),
  new AppRouteItem(
    title: 'About',
    subtitle: 'About Route',
    category: 'route',
    iconType: Icons.assignment_ind,
    routeName: AboutRoute.routeName,
    buildRoute: (BuildContext context) => new AboutRoute()
  )
];