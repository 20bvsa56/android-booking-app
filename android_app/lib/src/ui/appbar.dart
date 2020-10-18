import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, Widget leading})
      : super(
            key: key,
            title: title,
            leading: leading,
            backgroundColor: Color(0xff4c6792),
            elevation: 10,
            centerTitle: true,
            actions: <Widget>[]);
}

class TopNav extends StatefulWidget {
  @override
  _TopNavState createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff28d6e2),
        elevation: 10,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // drawer: MenuOption(),
    );
  }
}
