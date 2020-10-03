import 'package:android_app/src/ui/login.dart';
import 'package:flutter/material.dart';

class SignUpAlertBox extends StatefulWidget {
  @override
  _SignUpAlertBoxState createState() => _SignUpAlertBoxState();
}

class _SignUpAlertBoxState extends State<SignUpAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('You can book ticket only after sign up.'),
      content: Text('Would you like to continue?',
          style: TextStyle(color: Colors.black, fontSize: 18)),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Yes',
                style: TextStyle(color: Color(0xfff2a407), fontSize: 20))),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No',
                style: TextStyle(color: Color(0xfff2a407), fontSize: 20)))
      ],
      elevation: 24,
      contentPadding: EdgeInsets.all(20),
    );
  }
}
