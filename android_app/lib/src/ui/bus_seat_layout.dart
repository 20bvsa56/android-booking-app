import 'package:flutter/material.dart';

class BusSeatLayout extends StatefulWidget {
  @override
  _BusSeatLayoutState createState() => _BusSeatLayoutState();
}

class _BusSeatLayoutState extends State<BusSeatLayout> {
  @override
  Widget build(BuildContext context) {
    List<Widget> myRowChildren = [];
    List<List<int>> numbers = [];
    List<int> columnNumbers = [];

    for (int i = 0; i < 5; i++) {
      int col = 4;
      for (int j = 0; j < col; j++) {
        int currentNumber = j;
        columnNumbers.add(currentNumber);
      }

      numbers.add(columnNumbers);
      columnNumbers = [];
    }

    myRowChildren = numbers
        .map((columns) => Column(
            children: columns
                .map((nr) => IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.airline_seat_legroom_reduced_rounded,
                        size: 60,
                      ),
                    ))
                .toList()))
        .toList();

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: myRowChildren),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: myRowChildren),
          ])),
    ));
  }
}

