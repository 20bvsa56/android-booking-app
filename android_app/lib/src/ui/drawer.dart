import 'package:android_app/src/ui/account.dart';
import 'package:android_app/src/ui/home.dart';
import 'package:android_app/src/ui/size_config.dart';
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
        elevation: 10.0,
        child: Container(
          color: Color(0xff4c6792).withOpacity(0.8),
          child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(
              child: Icon(
                Icons.directions_bus,
                size: 150,
                color: Color(0xff4c6792),
              ),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: Color(0xff4c6792).withOpacity(0.1),
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 6, color: Colors.white),
                ),
                leading: Icon(Icons.home, size: 26, color: Colors.white),
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
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Tickets',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                leading:
                    Icon(Icons.import_contacts, size: 26, color: Colors.white),
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
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Account',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                leading:
                    Icon(Icons.account_circle, size: 26, color: Colors.white),
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
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                leading:
                    Icon(Icons.account_circle, size: 26, color: Colors.white),
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
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListTile(
                title: Text('Logout',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                leading: Icon(Icons.exit_to_app, size: 26, color: Colors.white),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (_) => false);
                },
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              color: Colors.white,
            ),
          ]),
        ));
  }
}
