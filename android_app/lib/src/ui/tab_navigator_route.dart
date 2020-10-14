import 'package:android_app/src/ui/account.dart';
import 'package:android_app/src/ui/bus_details_ui_builder.dart';
import 'package:android_app/src/ui/home.dart';
import 'package:android_app/src/ui/multi_nav_bar.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String home = '/';
  static const String busDetails = '/busDetails';
  static const String account = '/account';
}

class TabNavigator extends StatefulWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final AppBarItem tabItem;

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  void _push(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                routeBuilders[TabNavigatorRoutes.busDetails](context)));
  }

  // void _pushTickets(BuildContext context) {
  //   var routeBuilders = _routeBuilders(context);

  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               routeBuilders[TabNavigatorRoutes.tickets](context)));
  // }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.home: (context) => HomePage(
            onPush: (materialIndex) => _push(context),
          ),
      TabNavigatorRoutes.busDetails: (context) => BusDetailsUIBuilder(),
      TabNavigatorRoutes.account: (context) => AccountPage(
            onPush: (materialIndex) => _push(context),
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
        key: widget.navigatorKey,
        initialRoute: TabNavigatorRoutes.home,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}
