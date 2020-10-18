import 'package:android_app/src/ui/account.dart';
import 'package:android_app/src/ui/home.dart';
import 'package:android_app/src/ui/tickets_ui_builder.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Home")
      child = HomePage();
    else if (tabItem == "Tickets")
      child = TicketsUIBuilder();
    else if (tabItem == "Account") child = AccountPage();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
