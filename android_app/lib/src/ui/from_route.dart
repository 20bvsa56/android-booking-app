import 'package:android_app/src/model/from_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class FromRouteTextField extends StatefulWidget {
  TextEditingController fromSearchController = new TextEditingController();
  FromRouteTextField({Key key, this.fromSearchController}) : super(key: key);

  @override
  _FromRouteTextFieldState createState() => _FromRouteTextFieldState();
}

class _FromRouteTextFieldState extends State<FromRouteTextField> {
  List<FromRoute> fromRoutes = new List<FromRoute>();
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<FromRoute>> key = new GlobalKey();
  bool loading = true;

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

  @override
  Widget build(BuildContext context) {

    return Container(
      child: loading
          ? CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff28d6e2)))
          : searchTextField = AutoCompleteTextField<FromRoute>(
              controller: widget.fromSearchController,
              key: key,
              clearOnSubmit: false,
              suggestions: fromRoutes,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.directions_walk,
                    size: 26, color: Color(0xff28d6e2)),
                hintText: 'Kathmandu',
                hintStyle: TextStyle(fontSize: 15),
                labelText: 'Enter initial place',
                labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              //query is what the user types and item is a list of items passed
              itemFilter: (item, query) {
                return item.start_point
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
              },
              //compares two names and sorts according to that
              itemSorter: (a, b) {
                return a.start_point.compareTo(b.start_point);
              },
              itemSubmitted: (item) {
                setState(() {
                  searchTextField.textField.controller.text = item.start_point;
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
