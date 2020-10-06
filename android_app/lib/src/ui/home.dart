import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/drawer.dart';
import 'package:android_app/src/ui/find_bus.dart';
import 'package:android_app/src/ui/from_route.dart';
import 'package:android_app/src/ui/to_route.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<int> onPush;
  const HomePage({Key key,this.onPush}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final format = DateFormat("yyyy-MM-dd");
    DateTime _today = DateTime.now();

    return Scaffold(
      appBar: MyAppBar(),
      drawer: MenuOption(),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff4c6792).withAlpha(100),
              // image: DecorationImage(
              //     image: AssetImage(
              //       'lib/src/images/nature.jpg',
              //     ),
              //     fit: BoxFit.fill)
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xff28d6e2),
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Location',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff4c6792),
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: data.size.height / 3.8,
                  width: data.size.width / 1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff28d6e2)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [FromRouteTextField()],
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'To',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff28d6e2)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [ToRouteTextField()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xff28d6e2),
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Departure Date',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff4c6792),
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: data.size.height / 5.1,
                  width: data.size.width / 1.3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Select departure date',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff28d6e2)),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: DateTimeField(
                                initialValue: _today,
                                style: TextStyle(fontSize: 19),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.time_to_leave,
                                      size: 23, color: Color(0xff28d6e2)),
                                ),
                                format: format,
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return Theme(
                                            data: ThemeData(
                                              primarySwatch: Colors.blueGrey,
                                              primaryColor: Colors.blueGrey,
                                              accentColor: Colors.blueGrey,
                                            ),
                                            child: child);
                                      },
                                      context: context,
                                      firstDate: DateTime.now()
                                          .subtract(Duration(days: 0)),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2025));
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60.0, vertical: 10),
                              child: Row(
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _today = DateTime.now()
                                            .add(Duration(days: 1));
                                        print(_today);
                                      });
                                    },
                                    child: Text('Tomorrow',
                                        style: TextStyle(
                                            color: Colors.black87, fontSize: 16)),
                                    color: Color(0xffd2d6d6),
                                  ),
                                  Spacer(),
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _today = DateTime.now()
                                            .add(Duration(days: 2));
                                        print(_today);
                                      });
                                    },
                                    child: Text('Day After',
                                        style: TextStyle(
                                            color: Colors.black87, fontSize: 16)),
                                    color: Color(0xffd2d6d6),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: FlatButton(
                  color: Color(0xff4c6792),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(12.0),
                  onPressed: () {
                    // onPressed: _push,
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FindBus()),
                    );
                  },
                  child: Text(
                    "Find Bus",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
