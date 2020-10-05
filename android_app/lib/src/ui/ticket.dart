import 'package:android_app/src/ui/appbar.dart';
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
    );
  }
}
