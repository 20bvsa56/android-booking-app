import 'package:flutter/material.dart';

import 'package:android_app/src/ui/book_seat.dart';

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
                BOOKED_SEATS[4 * widget.rowNum + widget.colNum] =
                    '1'; // change 2D row, col to 1D index
              } else {
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
                      : widget.isAvailable ? Colors.grey : null,
              border: widget.isAvailable
                  ? Border.all(color: Colors.white, width: 3.0)
                  : null,
              borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
