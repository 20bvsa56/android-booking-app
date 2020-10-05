import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/drawer.dart';
import 'package:flutter/material.dart';

class TicketInfoPage extends StatefulWidget {
  const TicketInfoPage({Key key}) : super(key: key);

  @override
  _TicketInfoPageState createState() => _TicketInfoPageState();
}

class _TicketInfoPageState extends State<TicketInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MenuOption(),
      body: Center(
        child:
        Icon(
                Icons.directions_bus,
                size: 300,
                color: Color(0xff4c6792),
              ),
      ),
    );
  }
}
