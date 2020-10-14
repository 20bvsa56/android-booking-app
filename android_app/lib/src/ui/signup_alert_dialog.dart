import 'package:android_app/src/ui/login.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';

class SignUpAlertBox extends StatefulWidget {
  @override
  _SignUpAlertBoxState createState() => _SignUpAlertBoxState();
}

class _SignUpAlertBoxState extends State<SignUpAlertBox> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          width: SizeConfig.safeBlockHorizontal * 3,
          color: Color(0xff4c6792),
        ),
      ),
      title: Text(
        'You can book ticket only after sign up.',
        style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 6),
      ),
      content: Text('Would you like to continue?',
          style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.safeBlockHorizontal * 5)),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Yes',
                style: TextStyle(
                    color: Color(0xff4c6792),
                    fontSize: SizeConfig.safeBlockHorizontal * 7))),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No',
                style: TextStyle(
                    color: Color(0xff4c6792),
                    fontSize: SizeConfig.safeBlockHorizontal * 7)))
      ],
      elevation: 24,
      contentPadding: EdgeInsets.all(20),
    );
  }
}
