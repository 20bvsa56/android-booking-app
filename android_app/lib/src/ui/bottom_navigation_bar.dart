import 'package:android_app/src/ui/size_config.dart';
import 'package:android_app/src/ui/tab_navigator.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  String _currentPage = "Home";
  List<String> pageKeys = ["Home", "Tickets", "Account"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "Tickets": GlobalKey<NavigatorState>(),
    "Account": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //WillPopScope controls how routes are dismissed.
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Home") {
            _selectTab("Home", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Home"),
          _buildOffstageNavigator("Tickets"),
          _buildOffstageNavigator("Account"),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[200],
          selectedFontSize: SizeConfig.safeBlockHorizontal * 5.3,
          unselectedFontSize: SizeConfig.safeBlockHorizontal * 5,
          selectedItemColor: Color(0xff4c6792),
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home',
                  style: TextStyle(
                    color: Color(0xff4c6792),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.import_contacts),
              title: new Text('Tickets',
                  style: TextStyle(
                    color: Color(0xff4c6792),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text('Account',
                  style: TextStyle(
                    color: Color(0xff4c6792),
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    //offstage property is true if the tab being rendered doesn't match the current tab
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
