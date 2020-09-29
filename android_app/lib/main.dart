import 'package:android_app/src/ui/bottom_nav_bar.dart';
import 'package:android_app/src/ui/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Starting the app with the "/" named route.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Login Page widget.
        '/': (context) => LoginPage(),
        // When navigating to the "/navbarpage" route, build the navbarpage widget.
        '/navbarpage': (context) => NavigationBarPage(),
        // When navigating to the "/navbarpage" route, build the Login widget.
        '/login':(context)=> LoginPage()
      },
    );
  }
}
