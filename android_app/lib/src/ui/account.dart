import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/drawer.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final ValueChanged<int> onPush;
  const AccountPage({Key key, this.onPush}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MenuOption(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(Icons.person, size: 100, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      'Customer',
                      style: TextStyle(fontSize: 18, color: Color(0xff28d6e2)),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 120),
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
                              width: 3.0,
                            ),
                            left: BorderSide(
                              color: Colors.grey,
                              width: 3.0,
                            ),
                          ),
                        ),
                        child:
                            Icon(Icons.mode_edit, size: 30, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  InkWell(
                    onTap: () {
                      _userEditBottomSheet(context);
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(fontSize: 15, color: Color(0xff28d6e2)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(thickness: 1, color: Colors.blueGrey),
                SizedBox(height: 10),
                RichText(
                  text: new TextSpan(style: TextStyle(fontSize: 22), children: [
                    TextSpan(
                        text: 'Name:  ',
                        style: TextStyle(color: Color(0xff4c6792))),
                    TextSpan(
                        text: 'Matthew Perry',
                        style: TextStyle(color: Colors.black54, fontSize: 20))
                  ]),
                ),
                SizedBox(height: 10),
                Divider(thickness: 1, color: Colors.blueGrey),
                SizedBox(height: 10),
                RichText(
                  text: new TextSpan(style: TextStyle(fontSize: 22), children: [
                    TextSpan(
                        text: 'Email:  ',
                        style: TextStyle(color: Color(0xff4c6792))),
                    TextSpan(
                        text: 'matthewperry@gmail.com',
                        style: TextStyle(
                          color: Colors.black54,
                        ))
                  ]),
                ),
                SizedBox(height: 10),
                Divider(thickness: 1, color: Colors.blueGrey),
                SizedBox(height: 10),
                RichText(
                  text: new TextSpan(style: TextStyle(fontSize: 22), children: [
                    TextSpan(
                        text: 'Phone Number:  ',
                        style: TextStyle(color: Color(0xff4c6792))),
                    TextSpan(
                        text: '9999999999',
                        style: TextStyle(
                          color: Colors.black54,
                        ))
                  ]),
                ),
                SizedBox(height: 10),
                Divider(thickness: 1, color: Colors.blueGrey),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 140.0, vertical: 30),
            child: SizedBox(
              height: 60,
              width: double.infinity / 2,
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
                  "Logout",
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
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text('Edit Details',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff4c6792),
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.cancel, color: Color(0xff28d6e2)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                helperText: 'First Name',
                                helperStyle: TextStyle(
                                    fontSize: 15, color: Colors.black))),
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
                                    fontSize: 15, color: Colors.black))),
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
                                    fontSize: 15, color: Colors.black))),
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
                                    fontSize: 15, color: Colors.black))),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        color: Color(0xff4c6792),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
