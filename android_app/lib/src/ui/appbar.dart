import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, Widget leading})
      : super(
            key: key,
            title: title,
            backgroundColor: Color(0xff28d6e2),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: <Widget>[]);
}
