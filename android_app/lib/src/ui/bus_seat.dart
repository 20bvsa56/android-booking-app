import 'package:android_app/src/bloc/seat_count/counter_bloc.dart';
import 'package:android_app/src/ui/book_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BusSeat extends StatefulWidget {
  bool isReserved;
  bool isSelected;
  bool isAvailable;
  int rowNum;
  int colNum;

  BusSeat({
    this.rowNum,
    this.colNum,
    this.isSelected = false,
    this.isReserved = false,
    this.isAvailable = true,
  });

  @override
  _BusSeatState createState() => _BusSeatState();
}

class _BusSeatState extends State<BusSeat> {
  // List<String> BOOKED_SEATS = [];
  // Future<List<String>> allocatedSeatsArray(int trip_id) async {
  //   var data =
  //       await http.get("http://192.168.254.78:8000/api/getSeats?id=$trip_id");
  //   var jsonData = json.decode(data.body);
  //   print(jsonData.length);
  //   print(trip_id);

  //   print(BOOKED_SEATS);
  //   return BOOKED_SEATS;
  // }
  List<String> BOOKED_SEATS = [
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0'
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (this.mounted)
          setState(() {
            print('ouchhhhhhhh!!!!!!!!!!!!! => row ' +
                widget.rowNum.toString() +
                '  | col ' +
                widget.colNum.toString());

            // !widget.isReserved ? widget.isSelected = !widget.isSelected : null;

            if (!widget.isReserved) {
              widget.isSelected = !widget.isSelected;
              if (widget.isSelected) {
                context.bloc<CounterCubit>().addSeat();

                BOOKED_SEATS[4 * widget.rowNum + widget.colNum] =
                    '1'; // change 2D row, col to 1D index
              } else {
                context.bloc<CounterCubit>().subtractSeat();
                BOOKED_SEATS[4 * widget.rowNum + widget.colNum] = '0';
              }
            }

            print('booked: ' + BOOKED_SEATS.toString());
          });
      },
      child: Container(
          child: Icon(Icons.airline_seat_legroom_reduced,
              size: 30, color: Colors.white),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          decoration: BoxDecoration(
              color: widget.isReserved
                  ? Colors.orangeAccent
                  : widget.isSelected
                      ? Color(0xff28d6e2)
                      : widget.isAvailable
                          ? Colors.grey
                          : null,
              border: widget.isAvailable
                  ? Border.all(color: Colors.white, width: 3.0)
                  : null,
              borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
