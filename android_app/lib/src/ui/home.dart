import 'package:android_app/src/ui/image_carousel.dart';
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
        backgroundColor: Color(0xfff2a407),

        // automaticallyImplyLeading: false,
      ),
      drawer: MenuOption(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCarousel(),
            SizedBox(height: 20),
            Center(
              child: Container(
                  child: Text(
                'Choose your destination.',
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xfff2a407),
                    fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: data.size.width / 1.2,
                child: Column(children: <Widget>[
                  TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.directions_walk,
                            size: 26, color: Color(0xfff2a407)),
                        hintText: 'Kathmandu',
                        hintStyle: TextStyle(fontSize: 15),
                        labelText: 'Enter initial place',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  SizedBox(height: 15),
                  TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                       prefixIcon: Icon(Icons.directions_bus,
                            size: 25, color: Color(0xfff2a407)),
                        hintText: 'Pokhara',
                        hintStyle: TextStyle(fontSize: 15),
                        labelText: 'Enter final place',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  SizedBox(height: 15),
                  TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.accessibility,
                            size: 26, color: Color(0xfff2a407)),
                        hintText: 'Kathmandu',
                        hintStyle: TextStyle(fontSize: 15),
                        labelText: 'Enter stoppage place',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  SizedBox(height: 15),
                  DateTimeField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today,
                            size: 25, color: Color(0xfff2a407)),
                        labelText: 'Select travel date',
                        labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xfff2a407),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Book Ticket',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
