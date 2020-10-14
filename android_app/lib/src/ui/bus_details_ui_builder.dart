import 'package:android_app/src/model/bus_details_model.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/bus_details_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class BusDetailsUIBuilder extends StatefulWidget {
  final String start_point;
  final String end_point;
  final String departure_date;

  BusDetailsUIBuilder(
      {Key key, this.start_point, this.end_point, this.departure_date})
      : super(key: key);

  @override
  _BusDetailsUIBuilderState createState() => _BusDetailsUIBuilderState();
}

class _BusDetailsUIBuilderState extends State<BusDetailsUIBuilder> {
  List<BusDetailsModel> busDetailsList = [];

  Future<List<BusDetailsModel>> busDetails(
      String start_point, String end_point, String departure_date) async {
    var data = await http.get(
        // "http://192.168.254.78:8000/api/getBusDetails?start_point=$start_point&end_point=$end_point&departure_date=$departure_date");
        "http://192.168.1.101:8000/api/getBusDetails?start_point=$start_point&end_point=$end_point&departure_date=$departure_date");
    var jsonData = json.decode(data.body);

    // print(start_point);

    for (var i = 0; i < jsonData.length; i++) {
      final detail = BusDetailsModel.fromJson(jsonData[i]);
      busDetailsList.add(detail);
      print(busDetailsList.length.toString());
    }
    return busDetailsList;
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar:MyAppBar(),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    // Text(busDetailsList.length.toString() + ' buses found.',
                    // style: TextStyle(fontSize:20,color: Color(0xff4c6792)),),
                    FutureBuilder(
                      future: busDetails(widget.start_point, widget.end_point,
                          widget.departure_date),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return Container(
                            height: data.size.height,
                            width: data.size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  BusDetailsModel busDetailsModel =
                                      snapshot.data[index];

                                  return BusDetailsUI(
                                    busDetailsModel: busDetailsModel,
                                  );
                                }),
                          );
                        } else {
                          return CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Color(0xff4c6792)));
                        }
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
