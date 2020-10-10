import 'package:android_app/src/model/from_route.dart';
import 'package:android_app/src/model/to_route.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/bus_details_ui_builder.dart';
import 'package:android_app/src/ui/drawer.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<int> onPush;

  HomePage({Key key, this.onPush}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   TextEditingController dateController = new TextEditingController();

  //From route part
  List<FromRoute> fromRoutes = new List<FromRoute>();
  AutoCompleteTextField fromSearchTextField;
  GlobalKey<AutoCompleteTextFieldState<FromRoute>> fromKey = new GlobalKey();
  TextEditingController fromSearchController = new TextEditingController();
  // bool loading = true;

  void getFromRoutes() async {
    // final response = await http.get("http://192.168.1.101:8000/api/fromRoute");
    final response = await http.get("http://192.168.254.78:8000/api/fromRoute");
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

  List<FromRoute> loadFromRoutes(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return (parsed.map<FromRoute>((json) => FromRoute.fromJson(json))).toList();
  }

  Widget fromRow(FromRoute fromRoute) {
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

//To Rotues Part
  List<ToRoute> toRoutes = new List<ToRoute>();
  AutoCompleteTextField toSearchTextField;
  GlobalKey<AutoCompleteTextFieldState<ToRoute>> toKey = new GlobalKey();
  TextEditingController toSearchController = new TextEditingController();
  bool loading = true;

  void getToRoutes() async {
    // final response = await http.get("http://192.168.1.101:8000/api/toRoute");
    final response = await http.get("http://192.168.254.78:8000/api/toRoute");
    if (response.statusCode == 200) {
      toRoutes =
          loadToRoutes(response.body); //get from routes list from function
      print('To Routes: ${toRoutes.length}');

      setState(() {
        loading = false;
      });
    } else {
      print('Error! Cannot get the to routes');
    }
  }

  List<ToRoute> loadToRoutes(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return (parsed.map<ToRoute>((json) => ToRoute.fromJson(json))).toList();
  }

  Widget toRow(ToRoute toRoute) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          toRoute.end_point,
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        SizedBox(height: 35),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getFromRoutes();
    getToRoutes();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final data = MediaQuery.of(context);
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
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xff28d6e2),
size: SizeConfig.safeBlockHorizontal * 6,
                      
                    ),
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                    Text(
                      'Location',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 6,
                          color: Color(0xff4c6792),
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                 height: SizeConfig.safeBlockVertical * 30,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From',
                          style:
                             TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4, color: Color(0xff28d6e2)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              loading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Color(0xff28d6e2)))
                                  : fromSearchTextField =
                                      AutoCompleteTextField<FromRoute>(
                                      controller: fromSearchController,
                                      key: fromKey,
                                      clearOnSubmit: false,
                                      suggestions: fromRoutes,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.directions_walk,
                                            size: 26, color: Color(0xff28d6e2)),
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
                                          fromSearchTextField
                                              .textField
                                              .controller
                                              .text = item.start_point;
                                        });
                                      },
                                      itemBuilder: (context, item) {
                                        //ui for autocomplete
                                        return fromRow(item);
                                      },
                                    ),
                              
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
                        Text(
                          'To',
                          style:
                              TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4, color: Color(0xff28d6e2)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              loading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Color(0xff28d6e2)))
                                  : toSearchTextField =
                                      AutoCompleteTextField<ToRoute>(
                                      controller: toSearchController,
                                      key: toKey,
                                      clearOnSubmit: false,
                                      suggestions: toRoutes,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.directions_walk,
                                            size: 26, color: Color(0xff28d6e2)),
                                        hintText: 'Kathmandu',
                                        hintStyle: TextStyle(fontSize: 15),
                                        labelText: 'Enter final place',
                                        labelStyle: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                      //query is what the user types and item is a list of items passed
                                      itemFilter: (item, query) {
                                        return item.end_point
                                            .toLowerCase()
                                            .startsWith(query.toLowerCase());
                                      },
                                      //compares two names and sorts according to that
                                      itemSorter: (a, b) {
                                        return a.end_point
                                            .compareTo(b.end_point);
                                      },
                                      itemSubmitted: (item) {
                                        setState(() {
                                          toSearchTextField.textField.controller
                                              .text = item.end_point;
                                        });
                                      },
                                      itemBuilder: (context, item) {
                                        //ui for autocomplete
                                        return toRow(item);
                                      },
                                    ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xff28d6e2),
                      size: SizeConfig.safeBlockHorizontal * 6,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Departure Date',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 6,
                          color: Color(0xff4c6792),
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: SizeConfig.safeBlockVertical * 24,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Departure date',
                            style: TextStyle(
                               fontSize: SizeConfig.safeBlockHorizontal * 4, color: Color(0xff28d6e2)),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: DateTimeField(
                                controller: dateController,
                                initialValue: _today,
                                
                                 style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 2),
                                decoration: InputDecoration(
                                  labelText: 'Select departure date',
                                   labelStyle: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                  prefixIcon: Icon(Icons.time_to_leave,
                                      size: SizeConfig.safeBlockHorizontal * 6, color: Color(0xff28d6e2)),
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
                                          color: Colors.black87, fontSize: SizeConfig.safeBlockHorizontal * 3)),
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
                                              color: Colors.black87, fontSize: SizeConfig.safeBlockHorizontal * 3)),
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
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
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
                                    end_point: toSearchController.text,
                                    departure_date: dateController.text
                                  )),
                        );
                      },
                      child: Text(
                        "Find Bus",
                        style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4),
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
