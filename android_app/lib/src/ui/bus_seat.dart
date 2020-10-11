import 'package:flutter/material.dart';

class BusSeat extends StatefulWidget {
  bool isReserved;
  bool isSelected;
  bool isAvailable;

  BusSeat(
      {this.isSelected = false,
      this.isReserved = false,
      this.isAvailable = true});

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
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      },
      child: Container(
          child: Icon(Icons.airline_seat_legroom_reduced_rounded,
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
