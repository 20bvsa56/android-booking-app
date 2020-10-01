import 'package:android_app/src/ui/find_bus.dart';
import 'package:android_app/src/ui/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final format = DateFormat("yyyy-MM-dd");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,

        // automaticallyImplyLeading: false,
      ),
      drawer: MenuOption(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: data.size.height / 4.8,
                  width: data.size.width,
                  decoration: BoxDecoration(
                    color: Colors.teal[200],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: Container(
                    // decoration: BoxDecoration(color: Colors.white),
                    height: data.size.height / 5.5,
                    width: data.size.width / 2.2,
                    child: Text(
                      'Bus Booking Ticket Service Nepal',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                        child: Container(
                            child: Image.asset('lib/src/images/person.png',
                                height: 100)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Container(
                            child: Image.asset('lib/src/images/suitcases.png',
                                height: 80)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: data.size.height / 1.5,
              width: data.size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      height: data.size.height / 4,
                      width: data.size.width / 1.3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.directions_walk,
                                      size: 26, color: Color(0xfff2a407)),
                                  hintText: 'Kathmandu',
                                  hintStyle: TextStyle(fontSize: 15),
                                  labelText: 'Enter initial place',
                                  labelStyle: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'To',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.directions_walk,
                                      size: 26, color: Color(0xfff2a407)),
                                  hintText: 'Pokhara',
                                  hintStyle: TextStyle(fontSize: 15),
                                  labelText: 'Enter final place',
                                  labelStyle: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.time_to_leave,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Departure Date',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      height: data.size.height / 10,
                      width: data.size.width / 1.3,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: DateTimeField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_today,
                                  size: 25, color: Color(0xfff2a407)),
                              labelText: 'Select departure date',
                              labelStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                            },
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: FlatButton(
                      color: Color(0xfff2a407),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindBus()),
                        );
                      },
                      child: Text(
                        "Find Bus",
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ),
                  ),

                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
