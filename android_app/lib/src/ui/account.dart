import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  String firstName, lastName, email, phoneNumber;
  final ValueChanged<int> onPush;
  AccountPage(
      {Key key,
      this.onPush,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber})
      : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('lib/src/images/person.png'),
                        radius: 65,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical),
                    Center(
                      child: Text(
                        'Customer',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                            color: Color(0xff28d6e2)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _userEditBottomSheet(context);
                      print('edit details');
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: SizeConfig.safeBlockHorizontal,
                            ),
                            left: BorderSide(
                              color: Colors.grey,
                              width: SizeConfig.safeBlockHorizontal,
                            ),
                          ),
                        ),
                        child:
                            Icon(Icons.mode_edit, size: 30, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical),
                  InkWell(
                    onTap: () {
                      _userEditBottomSheet(context);
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 2.5,
                          color: Color(0xff28d6e2)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 5),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(thickness: 1, color: Colors.blueGrey),
                SizedBox(height: SizeConfig.safeBlockVertical),
                RichText(
                  text: new TextSpan(
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 2.8),
                      children: [
                        TextSpan(
                            text: 'Name:  ',
                            style: TextStyle(color: Color(0xff4c6792))),
                        TextSpan(
                            text: widget.firstName,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.safeBlockVertical * 3.1))
                      ]),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical),
                Divider(thickness: 1, color: Colors.blueGrey),
                SizedBox(height: SizeConfig.safeBlockVertical),
                RichText(
                  text: new TextSpan(
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 2.8),
                      children: [
                        TextSpan(
                            text: 'Email:  ',
                            style: TextStyle(color: Color(0xff4c6792))),
                        TextSpan(
                            text: widget.email,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 3.1,
                              color: Colors.black54,
                            ))
                      ]),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical),
                Divider(thickness: 1, color: Colors.blueGrey),
                SizedBox(height: SizeConfig.safeBlockVertical),
                RichText(
                  text: new TextSpan(
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 2.8),
                      children: [
                        TextSpan(
                            text: 'Phone Number:  ',
                            style: TextStyle(color: Color(0xff4c6792))),
                        TextSpan(
                            text: widget.phoneNumber,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 3.1,
                              color: Colors.black54,
                            ))
                      ]),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical),
                Divider(thickness: 1, color: Colors.blueGrey),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 140.0, vertical: 30),
            child: SizedBox(
              height: SizeConfig.safeBlockVertical * 7,
              width: SizeConfig.screenWidth,
              child: FlatButton(
                color: Color(0xff4c6792),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (_) => false);
                },
                child: Text(
                  "Log out",
                  style:
                      TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _userEditBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
            height: SizeConfig.safeBlockVertical * 63,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text('Edit Details',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              color: Color(0xff4c6792),
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.cancel,
                              color: Color(0xff28d6e2),
                              size: SizeConfig.safeBlockHorizontal * 8),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                helperText: 'First Name',
                                helperStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4.5,
                                    color: Colors.black))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                helperText: 'Last Name',
                                helperStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4.5,
                                    color: Colors.black))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                helperText: 'Email Address',
                                helperStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4.5,
                                    color: Colors.black))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                helperText: 'Phone Number',
                                helperStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4.5,
                                    color: Colors.black))),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // FlatButton(
                      //   color: Color(0xff4c6792),
                      //   textColor: Colors.white,
                      //   padding: EdgeInsets.all(12.0),
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: Text(
                      //     "Save",
                      //     style: TextStyle(fontSize: 24.0),
                      //   ),
                      // ),

                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 7,
                        width: SizeConfig.safeBlockHorizontal * 25,
                        child: FlatButton(
                          color: Color(0xff4c6792),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
