import 'package:android_app/src/ui/menu_option.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      drawer: MenuOption(),
      body: SingleChildScrollView(
        child: Column(
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
                        child:
                            Icon(Icons.person, size: 100, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Text(
                        'Customer',
                        style: TextStyle(fontSize: 18, color: Colors.orange),
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
                          child: Icon(Icons.mode_edit,
                              size: 30, color: Colors.grey),
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
                        style: TextStyle(fontSize: 15, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  TextField(
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black26, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  SizedBox(height: 10),
                  TextField(
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black26, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0)
                          
                          
                          ,
                        ),
                      )),
                  SizedBox(height: 10),
                  TextField(
                      readOnly: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black26, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  SizedBox(height: 10),
                  TextField(
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black26, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Color(0xfff2a407),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (_) => false);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ],
            ),
          ],
        ),
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
                              fontSize: 20,
                              color: Color(0xfff2a407),
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.cancel, color: Color(0xfff2a407)),
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
                        color: Colors.green,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 20.0),
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
