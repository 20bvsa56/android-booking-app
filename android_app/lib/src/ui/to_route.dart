import 'package:android_app/src/model/to_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class ToRouteTextField extends StatefulWidget {
  const ToRouteTextField({Key key}) : super(key: key);

  @override
  _ToRouteTextFieldState createState() => _ToRouteTextFieldState();
}

class _ToRouteTextFieldState extends State<ToRouteTextField> {
  List<ToRoute> toRoutes = new List<ToRoute>();
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<ToRoute>> key = new GlobalKey();
  bool loading = true;

//To Rotues Part
  void getToRoutes() async {
    final response = await http.get("http://192.168.1.2:8000/api/toRoute");
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

  @override
  void initState() {
    getToRoutes();
    super.initState();
  }

 Widget row(ToRoute toRoute) {
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
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff28d6e2)))
          : searchTextField = AutoCompleteTextField<ToRoute>(
              key: key,
              clearOnSubmit: false,

              suggestions: toRoutes,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.directions_walk,
                    size: 26, color: Color(0xff28d6e2)),
                hintText: 'Kathmandu',
                hintStyle: TextStyle(fontSize: 15),
                labelText: 'Enter final place',
                labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              //query is what the user types and item is a list of items passed
              itemFilter: (item, query) {
                return item.end_point
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
              },
              //compares two names and sorts according to that
              itemSorter: (a, b) {
                return a.end_point.compareTo(b.end_point);
              },
              itemSubmitted: (item) {
                setState(() {
                  searchTextField.textField.controller.text = item.end_point;
                });
              },
              itemBuilder: (context, item) {
                //ui for autocomplete
                return row(item);
              },
            ),
    );
  }
}
