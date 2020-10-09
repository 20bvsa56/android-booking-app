// import 'package:android_app/src/ui/account.dart';
// import 'package:android_app/src/ui/find_bus.dart';
// import 'package:android_app/src/ui/home.dart';
// import 'package:android_app/src/ui/multi_nav_bar.dart';
// import 'package:android_app/src/ui/ticket.dart';
// import 'package:flutter/material.dart';

// class TabNavigatorRoutes {
//   static const String home = '/';
//   static const String tickets = '/tickets';
//   static const String account = '/account';
//   static const String findBus = '/findBus';
// }

// class TabNavigator extends StatefulWidget {
//   TabNavigator({this.navigatorKey, this.tabItem});
//   final GlobalKey<NavigatorState> navigatorKey;
//   final AppBarItem tabItem;

//   @override
//   _TabNavigatorState createState() => _TabNavigatorState();
// }

// class _TabNavigatorState extends State<TabNavigator> {
//   void _push(BuildContext context) {
//     var routeBuilders = _routeBuilders(context);

//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 routeBuilders[TabNavigatorRoutes.findBus](context)));
//   }

//   void _pushTickets(BuildContext context) {
//     var routeBuilders = _routeBuilders(context);

//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 routeBuilders[TabNavigatorRoutes.tickets](context)));
//   }

//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
//     return {
//       TabNavigatorRoutes.home: (context) => HomePage(
//             onPush: (materialIndex) => _push(context),
//           ),
//       TabNavigatorRoutes.findBus: (context) => FindBus(),
      
//       TabNavigatorRoutes.tickets: (context) => HomePage(
//             onPush: (materialIndex) => _pushTickets(context),
//           ),
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     final routeBuilders = _routeBuilders(context);
//     return Navigator(
//         key: widget.navigatorKey,
//         initialRoute: TabNavigatorRoutes.home,
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//               builder: (context) => routeBuilders[routeSettings.name](context));
//         });
//   }
// }
