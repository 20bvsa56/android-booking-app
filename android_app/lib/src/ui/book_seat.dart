import 'package:http/http.dart' as http;
import 'dart:convert';

// List<String> BOOKED_SEATS = [
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0',
//   '0'
// ];

// // TODO: initialize this list according to allocated_seats in database

// List<String> seatsArray = [];
List<String> BOOKED_SEATS = [];

Future<List<String>> allocatedSeatsArray(int trip_id) async {
  var data =
      await http.get("http://192.168.1.101:8000/api/getSeats?id=$trip_id");
  var jsonData = json.decode(data.body);
  print(jsonData.length);

  return BOOKED_SEATS;
}
