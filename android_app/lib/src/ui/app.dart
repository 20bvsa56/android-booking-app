// import 'package:android_app/src/ui/multi_nav_bar.dart';
// import 'package:android_app/src/ui/tab_navigator_route.dart';
// import 'package:flutter/material.dart';

// class App extends StatefulWidget {
//   const App({Key key}) : super(key: key);

//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   AppBarItem _currentTab = AppBarItem.home;

//   //map of global navigator keys
//   Map<AppBarItem, GlobalKey<NavigatorState>> _navigatorKeys = {
//     AppBarItem.home: GlobalKey<NavigatorState>(),
//     AppBarItem.tickets: GlobalKey<NavigatorState>(),
//     AppBarItem.account: GlobalKey<NavigatorState>(),
//   };

//   void _selectTab(AppBarItem tabItem) {
//     if (tabItem == _currentTab) {
//       // pop to first route
//       _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
//     } else {
//       setState(() => _currentTab = tabItem);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final isFirstRouteInCurrentTab =
//             !await _navigatorKeys[_currentTab].currentState.maybePop();
//         if (isFirstRouteInCurrentTab) {
//           // if not on the 'main' tab
//           if (_currentTab != AppBarItem.home) {
//             // select 'main' tab
//             _selectTab(AppBarItem.home);
//             // back button handled by app
//             return false;
//           }
//         }
//         // let system handle back button if we're on the first route
//         return isFirstRouteInCurrentTab;
//       },
//       //in scaffold body, create a Stack with one child for each tab
//       child: Scaffold(
//         body: Stack(children: <Widget>[
//           _buildOffstageNavigator(AppBarItem.home),
//           _buildOffstageNavigator(AppBarItem.tickets),
//           _buildOffstageNavigator(AppBarItem.account),
//         ]),
//         bottomNavigationBar: BottomNavigation(
//           currentTab: _currentTab,
//           onSelectTab: _selectTab,
//         ),
//       ),
//     );
//   }

//   Widget _buildOffstageNavigator(AppBarItem tabItem) {
//     //Offstage widgets ensures that all our navigators preserve their state as they remain inside the widget tree.
//     return Offstage(
//       offstage: _currentTab != tabItem,
//       child: TabNavigator(
//         navigatorKey: _navigatorKeys[tabItem],
//         tabItem: tabItem,
//       ),
//     );
//   }
// }
