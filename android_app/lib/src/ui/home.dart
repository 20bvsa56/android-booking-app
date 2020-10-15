import 'package:android_app/src/model/destinations_model.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/bus_details_ui_builder.dart';
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

  List<DestinationsModel> destinations = new List<DestinationsModel>();
  AutoCompleteTextField destinationsSearchTextField;
  AutoCompleteTextField destinationsSearchTextField2;
  GlobalKey<AutoCompleteTextFieldState<DestinationsModel>> key =
      new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<DestinationsModel>> key2 =
      new GlobalKey();
  TextEditingController destinationsController = new TextEditingController();
  TextEditingController destinationsController2 = new TextEditingController();
  bool loading = true;

  void getDestinations() async {
    final response =
        await http.get("http://192.168.1.101:8000/api/getDestinations");
    // final response =
    //     await http.get("http://192.168.254.78:8000/api/getDestinations");
    if (response.statusCode == 200) {
      destinations =
          loadDestinations(response.body); //get from routes list from function
      print('From Routes: ${destinations.length}');

      setState(() {
        loading = false;
      });
    } else {
      print('Error! Cannot get the destinations.');
    }
  }

  List<DestinationsModel> loadDestinations(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return (parsed.map<DestinationsModel>(
        (json) => DestinationsModel.fromJson(json))).toList();
  }

  Widget showDestinations(DestinationsModel destinations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          destinations.name,
          style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              color: Colors.black54),
        ),
        SizedBox(height: SizeConfig.safeBlockVertical * 4),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getDestinations();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final format = DateFormat("yyyy-MM-dd");
    DateTime _today = DateTime.now();

    return Scaffold(
      appBar: MyAppBar(),
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
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 3),
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
                  height: SizeConfig.safeBlockVertical * 31,
                  width: SizeConfig.safeBlockHorizontal * 90,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                              color: Color(0xff28d6e2)),
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
                                  : destinationsSearchTextField =
                                      AutoCompleteTextField<DestinationsModel>(
                                      controller: destinationsController,
                                      key: key,
                                      clearOnSubmit: false,
                                      suggestions: destinations,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.directions_walk,
                                            size:
                                                SizeConfig.safeBlockHorizontal *
                                                    5,
                                            color: Color(0xff28d6e2)),
                                        hintText: 'Kathmandu',
                                        hintStyle: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    4),
                                        labelText: 'Enter initial place',
                                        labelStyle: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    4,
                                            color: Colors.grey),
                                      ),
                                      //query is what the user types and item is a list of items passed
                                      itemFilter: (item, query) {
                                        return item.name
                                            .toLowerCase()
                                            .startsWith(query.toLowerCase());
                                      },
                                      //compares two names and sorts according to that
                                      itemSorter: (a, b) {
                                        return a.name.compareTo(b.name);
                                      },
                                      itemSubmitted: (item) {
                                        setState(() {
                                          destinationsSearchTextField.textField
                                              .controller.text = item.name;
                                        });
                                      },
                                      itemBuilder: (context, item) {
                                        //ui for autocomplete
                                        return showDestinations(item);
                                      },
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockHorizontal * 9),
                        Text(
                          'To',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                              color: Color(0xff28d6e2)),
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
                                  : destinationsSearchTextField2 =
                                      AutoCompleteTextField<DestinationsModel>(
                                      controller: destinationsController2,
                                      key: key2,
                                      clearOnSubmit: false,
                                      suggestions: destinations,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.directions_walk,
                                            size:
                                                SizeConfig.safeBlockHorizontal *
                                                    5,
                                            color: Color(0xff28d6e2)),
                                        hintText: 'Kathmandu',
                                        hintStyle: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    4),
                                        labelText: 'Enter final place',
                                        labelStyle: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    4,
                                            color: Colors.grey),
                                      ),
                                      //query is what the user types and item is a list of items passed
                                      itemFilter: (item, query) {
                                        return item.name
                                            .toLowerCase()
                                            .startsWith(query.toLowerCase());
                                      },
                                      //compares two names and sorts according to that
                                      itemSorter: (a, b) {
                                        return a.name.compareTo(b.name);
                                      },
                                      itemSubmitted: (item) {
                                        setState(() {
                                          destinationsSearchTextField2.textField
                                              .controller.text = item.name;
                                        });
                                      },
                                      itemBuilder: (context, item) {
                                        //ui for autocomplete
                                        return showDestinations(item);
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xff28d6e2),
                      size: SizeConfig.safeBlockHorizontal * 6,
                    ),
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 3),
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
                  height: SizeConfig.safeBlockVertical * 23,
                  width: SizeConfig.safeBlockHorizontal * 90,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Departure date',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                                color: Color(0xff28d6e2)),
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
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5),
                                decoration: InputDecoration(
                                  labelText: 'Select departure date',
                                  labelStyle: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4,
                                      color: Colors.grey),
                                  prefixIcon: Icon(Icons.time_to_leave,
                                      size: SizeConfig.safeBlockHorizontal * 5,
                                      color: Color(0xff28d6e2)),
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
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    3.5)),
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
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    3.5)),
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
              SizedBox(height: SizeConfig.safeBlockVertical * 3),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 140.0),
                  child: SizedBox(
                    height: SizeConfig.safeBlockVertical * 7,
                    width: SizeConfig.screenWidth,
                    child: FlatButton(
                      color: Color(0xff4c6792),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        // onPressed: _push,
                        if (destinationsController.text.isEmpty ||
                            destinationsController2.text.isEmpty ||
                            dateController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Dialog(
                                      backgroundColor: Color(0xff4c6792),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 20,
                                      child: Text(
                                        'Please fill all the required fields.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    5),
                                      )),
                                );
                              });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BusDetailsUIBuilder(
                                    start_point: destinationsController.text,
                                    end_point: destinationsController2.text,
                                    departure_date: dateController.text)),
                          );
                        }
                      },
                      child: Text(
                        "Find Bus",
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6),
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
