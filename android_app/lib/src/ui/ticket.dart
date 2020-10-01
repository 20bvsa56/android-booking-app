import 'package:android_app/src/ui/menu_option.dart';
import 'package:flutter/material.dart';

class TicketInfoPage extends StatelessWidget {
  const TicketInfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      drawer: MenuOption(),
       body: Center(child: Text('Ticket')),
    );
  }
}
