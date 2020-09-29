import 'package:android_app/src/ui/account.dart';
import 'package:android_app/src/ui/home.dart';
import 'package:android_app/src/ui/ticket.dart';
import 'package:flutter/material.dart';

class MenuOption extends StatefulWidget {
  MenuOption({Key key}) : super(key: key);

  @override
  _MenuOptionState createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 16.0,
        child: Container(
          color: Colors.white24,
          child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(
              child: Image(image: AssetImage('lib/src/images/logo.png')),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: Color(0xfff2a407),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                leading: Icon(Icons.home, size: 26, color: Color(0xfff2a407)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Tickets',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                leading: Icon(Icons.import_contacts,
                    size: 26, color: Color(0xfff2a407)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicketInfoPage()),
                  );
                },
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Account',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                leading: Icon(Icons.account_circle,
                    size: 26, color: Color(0xfff2a407)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.grey,
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                leading: Icon(Icons.account_circle,
                    size: 26, color: Color(0xfff2a407)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text('Logout',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                leading:
                    Icon(Icons.exit_to_app, size: 26, color: Color(0xfff2a407)),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
                },
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: Color(0xfff2a407),
            ),
          ]),
        ));
  }
}
