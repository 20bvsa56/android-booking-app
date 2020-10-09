import 'package:android_app/src/model/from_route.dart';
import 'package:android_app/src/model/to_route.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/bus_details_ui_builder.dart';
import 'package:android_app/src/ui/drawer.dart';
import 'package:android_app/src/ui/find_bus.dart';
import 'package:android_app/src/ui/from_route.dart';
import 'package:android_app/src/ui/to_route.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<int> onPush;

  HomePage({Key key, this.onPush}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<FromRoute> fromRoutes = new List<FromRoute>();
    AutoCompleteTextField searchTextField;
    GlobalKey<AutoCompleteTextFieldState<FromRoute>> key = new GlobalKey();
    bool loading = true;
    TextEditingController fromSearchController = new TextEditingController();

    List<FromRoute> loadFromRoutes(String jsonString) {
      final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
      return (parsed.map<FromRoute>((json) => FromRoute.fromJson(json)))
          .toList();
    }

    void getFromRoutes() async {
      // final response = await http.get("http://192.168.1.101:8000/api/fromRoute");
      final response =
          await http.get("http://192.168.254.78:8000/api/fromRoute");
      if (response.statusCode == 200) {
        fromRoutes =
            loadFromRoutes(response.body); //get from routes list from function
        print('From Routes: ${fromRoutes.length}');

        setState(() {
          loading = false;
        });
      } else {
        print('Error! Cannot get the from routes');
      }
    }

    @override
    void initState() {
      getFromRoutes();
      super.initState();
    }

    Widget row(FromRoute fromRoute) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fromRoute.start_point,
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          SizedBox(height: 35),
        ],
      );
    }

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
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Container(
                                child: loading
                                    ? CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Color(0xff28d6e2)))
                                    : searchTextField =
                                        AutoCompleteTextField<FromRoute>(
                                        controller: fromSearchController,
                                        key: key,
                                        clearOnSubmit: false,
                                        suggestions: fromRoutes,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                              Icons.directions_walk,
                                              size: 26,
                                              color: Color(0xff28d6e2)),
                                          hintText: 'Kathmandu',
                                          hintStyle: TextStyle(fontSize: 15),
                                          labelText: 'Enter initial place',
                                          labelStyle: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                        //query is what the user types and item is a list of items passed
                                        itemFilter: (item, query) {
                                          return item.start_point
                                              .toLowerCase()
                                              .startsWith(query.toLowerCase());
                                        },
                                        //compares two names and sorts according to that
                                        itemSorter: (a, b) {
                                          return a.start_point
                                              .compareTo(b.start_point);
                                        },
                                        itemSubmitted: (item) {
                                          setState(() {
                                            searchTextField.textField.controller
                                                .text = item.start_point;
                                          });
                                        },
                                        itemBuilder: (context, item) {
                                          //ui for autocomplete
                                          return row(item);
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
              
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
                                            color: Colors.black87,
                                            fontSize: 16)),
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
                                            color: Colors.black87,
                                            fontSize: 16)),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 140.0),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity / 2,
                    child: FlatButton(
                      color: Color(0xff4c6792),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        // onPressed: _push,
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BusDetailsUIBuilder(
                                    start_point: fromSearchController.text,
                                    //  end_point: toValue.toSearchController.text,
                                  )),
                        );
                      },
                      child: Text(
                        "Find Bus",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
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


