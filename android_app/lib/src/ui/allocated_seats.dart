// import 'package:android_app/src/model/allocated_seats_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AllocatedSeatsBuilder extends StatefulWidget {
//   @override
//   _AllocatedSeatsBuilderState createState() => _AllocatedSeatsBuilderState();
// }

// class _AllocatedSeatsBuilderState extends State<AllocatedSeatsBuilder> {
//   List<AllocatedSeats> seatsArray = [];

//   Future<List<AllocatedSeats>> busDetails(int trip_id) async {
//     var data =
//         await http.get("http://192.168.1.101:8000/api/getSeats?id=$trip_id");
//     var jsonData = json.decode(data.body);

//     // print(start_point);

//     for (var i = 0; i < jsonData.length; i++) {
//       final detail = AllocatedSeats.fromJson(jsonData[i]);
//       seatsArray.add(detail);
//       print(seatsArray.length.toString());
//     }
//     return seatsArray;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
