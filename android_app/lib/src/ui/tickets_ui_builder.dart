import 'package:android_app/src/model/tickets_model.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:android_app/src/ui/tickets_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TicketsUIBuilder extends StatefulWidget {
  TicketsUIBuilder({Key key}) : super(key: key);
  @override
  _TicketsUIBuilderState createState() => _TicketsUIBuilderState();
}

class _TicketsUIBuilderState extends State<TicketsUIBuilder> {
  List<TicketsModel> ticketsList = [];

  Future<List<TicketsModel>> tickets() async {
    var data = await http.get('http://192.168.1.101:8000/api/getTickets');
    var jsonData = json.decode(data.body);

    // print(start_point);

    for (var i = 0; i < jsonData.length; i++) {
      final detail = TicketsModel.fromJson(jsonData[i]);
      ticketsList.add(detail);
      print(ticketsList.length.toString());
    }
    return ticketsList;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: MyAppBar(),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    // Text(busDetailsList.length.toString() + ' buses found.',
                    // style: TextStyle(fontSize:20,color: Color(0xff4c6792)),),
                    SingleChildScrollView(
                      child: FutureBuilder(
                        future: tickets(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data != null) {
                            return Container(
                              height: SizeConfig.screenHeight,
                              width: SizeConfig.screenWidth,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    TicketsModel ticketsModel =
                                        snapshot.data[index];

                                    return TicketsUI(
                                      ticketsModel: ticketsModel,
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
                    ),
                  ],
                ),
              ),
            )));
  }
}
