import 'package:android_app/src/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:android_app/src/ui/size_config.dart';

enum AppBarItem { home, tickets, account}
Map<AppBarItem, String> tabName = {
  AppBarItem.home: 'Home',
  AppBarItem.tickets: 'Tickets',
  AppBarItem.account: 'Account',
};

Map<AppBarItem, Icon> tabIcons = {
  AppBarItem.home: Icon(Icons.home),
  AppBarItem.tickets: Icon(Icons.import_contacts),
  AppBarItem.account: Icon(Icons.account_circle)
};

Map<AppBarItem, MaterialColor> activeTabColor = {
  AppBarItem.home: Colors.red,
  AppBarItem.tickets: Colors.green,
  AppBarItem.account: Colors.blue,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final AppBarItem currentTab;
  final ValueChanged<AppBarItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BottomNavigationBar(
      // backgroundColor: Color(0xff4c6792),
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: AppBarItem.home),
        _buildItem2(tabItem: AppBarItem.tickets),
        _buildItem3(tabItem: AppBarItem.account),
      ],
      onTap: (index) => onSelectTab(
        AppBarItem.values[index],
      ),
    );
  }

  Color _colorTabMatching({AppBarItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }

  BottomNavigationBarItem _buildItem({AppBarItem tabItem}) {
    String text = tabName[tabItem];
     IconData icon = Icons.home;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
        size: SizeConfig.safeBlockHorizontal * 2,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 2,
          fontWeight: FontWeight.w800,
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem2({AppBarItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.import_contacts;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
        size: SizeConfig.safeBlockHorizontal * 27,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 2,
          fontWeight: FontWeight.w800,
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem3({AppBarItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.account_circle;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: SizeConfig.safeBlockHorizontal * 2,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 2,
          fontWeight: FontWeight.w800,
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }
}
