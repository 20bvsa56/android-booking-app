import 'package:android_app/src/model/bus_details_model.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/bus_details_ui.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        //"http://192.168.254.78:8000/api/getBusDetails?start_point=$start_point&end_point=$end_point&departure_date=$departure_date");
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
    var length = busDetailsList.length + 1;
    SizeConfig().init(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: MyAppBar(
              leading: IconButton(
                icon: Icon(Icons.keyboard_backspace),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: busDetails(widget.start_point, widget.end_point,
                            widget.departure_date),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          print('length of list ${busDetailsList.length}');

                          if (busDetailsList.length == 0) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 300),
                              child: Text(
                                'No bus available for the route ' +
                                    widget.start_point +
                                    ' and ' +
                                    widget.end_point +
                                    ' on ' +
                                    widget.departure_date +
                                    '.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 5,
                                    color: Color(0xff4c6792),
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          } else if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                              height: SizeConfig.screenHeight,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    BusDetailsModel busDetailsModel =
                                        snapshot.data[index];

                                    return BusDetailsUI(
                                      busDetailsModel: busDetailsModel,
                                    );
                                  }),
                            );
                          }
                        }),
                  ],
                ),
              ),
            )));
  }
}
