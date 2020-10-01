import 'package:android_app/src/ui/account.dart';
import 'package:android_app/src/ui/home.dart';
import 'package:android_app/src/ui/ticket.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  
  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey('Page1'),
    ),
    TicketInfoPage(
      key: PageStorageKey('Page2'),
    ),
    AccountPage(
      key: PageStorageKey('Page3'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[400],
        selectedFontSize: 22,
        unselectedFontSize: 19,
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,size: 30,), title: Text('Home',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(icon: Icon(Icons.import_contacts,color: Colors.white,size: 30,), title: Text('Tickets',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle,color: Colors.white,size: 30,), title: Text('Account',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold))),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
