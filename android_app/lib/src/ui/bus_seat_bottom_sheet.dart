import 'package:android_app/src/bloc/seat_count/counter_bloc.dart';
import 'package:android_app/src/ui/signup_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:android_app/src/ui/bus_seat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusSeatBottomSheet extends StatefulWidget {
  final int id, price, row, column, layout;
  final String name, start_point, end_point, departure_date;
  bool isReserved;
  bool isSelected;
  bool isAvailable;

  BusSeatBottomSheet(
      {Key key,
      this.id,
      this.price,
      this.name,
      this.start_point,
      this.end_point,
      this.departure_date,
      this.row,
      this.column,
      this.layout,
      this.isAvailable = true,
      this.isReserved = false,
      this.isSelected = false})
      : super(key: key);
  @override
  _BusSeatBottomSheetState createState() => _BusSeatBottomSheetState();
}

class _BusSeatBottomSheetState extends State<BusSeatBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // Bloc.observer = CounterObserver();
    SizeConfig().init(context);

    List<Widget> myRowChildren = [];

    for (int i = 0; i < widget.column; i++) {
      List<Widget> cols = [];

      for (int j = 0; j < widget.row; j++) {
        cols.add(BusSeat(rowNum: j, colNum: i));
      }

      myRowChildren.add(new Column(children: cols));
    }

    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Scaffold(
        body: BottomSheet(
            onClosing: () {
              print('closed');
            },
            backgroundColor: Colors.transparent,
            builder: (context) => Container(
                  color: Color(0xff4c6792),
                  height: SizeConfig.safeBlockVertical * 100,
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 70,
                    child: Stack(children: [
                      Container(
                        height: SizeConfig.safeBlockVertical * 10,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 27),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 15),
                                child: Text('View Seats',
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 3,
                                        color: Color(0xff4c6792),
                                        fontWeight: FontWeight.bold)),
                              ),
                              Spacer(),
                              IconButton(
                                  icon: Icon(Icons.cancel,
                                      size: SizeConfig.safeBlockVertical * 4,
                                      color: Color(0xff28d6e2)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 70, left: 5),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  8,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 1.5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: SizeConfig.safeBlockHorizontal * 4,
                                  ),
                                  Text(
                                    ' ' +
                                        widget.start_point +
                                        ' - ' +
                                        widget.end_point,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                4.5,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 1),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: SizeConfig.safeBlockHorizontal * 4,
                                  ),
                                  Text(' ' + widget.departure_date,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  4,
                                          color: Colors.white))
                                ],
                              ),
                              SizedBox(
                                  height: SizeConfig.safeBlockVertical * 3),
                              Container(
                                height: SizeConfig.safeBlockVertical * 10,
                                width: SizeConfig.safeBlockHorizontal * 90,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    3.2,
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    6,
                                            decoration: BoxDecoration(
                                                color: Colors.orangeAccent,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)))),
                                        SizedBox(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    1.8),
                                        Text(' BOOKED SEAT',
                                            style: TextStyle(
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    3,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    3.2,
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    6,
                                            decoration: BoxDecoration(
                                                color: Color(0xff28d6e2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)))),
                                        SizedBox(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    1.8),
                                        Text('SELECTED SEAT',
                                            style: TextStyle(
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    3,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    3.2,
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    6,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)))),
                                      ),
                                      SizedBox(
                                          height: SizeConfig.safeBlockVertical *
                                              1.8),
                                      Text('AVAILABLE SEAT ',
                                          style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  3,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  )
                                ]),
                              )
                            ],
                          )),
                      DraggableScrollableSheet(
                          initialChildSize: 0.6,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            var totalAmount = widget.price * 2;

                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  // color: Colors.white,
                                  color: Color(0xff4c6792)),
                              child: SingleChildScrollView(
                                child: Container(
                                  child: Column(children: [
                                    Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: SingleChildScrollView(
                                          child: Container(
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    90,
                                            height: SizeConfig
                                                    .safeBlockVertical *
                                                10 *
                                                widget
                                                    .row, // assuming one row takes 10 size
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Column(children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: SizeConfig
                                                              .safeBlockHorizontal *
                                                          10,
                                                      height: SizeConfig
                                                              .safeBlockVertical *
                                                          10,
                                                      child: Image.asset(
                                                        'lib/src/images/door.png',
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      width: SizeConfig
                                                              .safeBlockHorizontal *
                                                          10,
                                                      height: SizeConfig
                                                              .safeBlockVertical *
                                                          9,
                                                      child: Image.asset(
                                                        'lib/src/images/steering.png',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // children: <Widget>[
                                                  //   Row(
                                                  //     children: numbers.map((i, element) => MapEntry(i, Stack(
                                                  //       GestureDetector(onTap: () {
                                                  //         setState() {
                                                  //           // print("element=${element.toString()}");
                                                  //           // print("element=${userBoard[i].toString()}");
                                                  //         }
                                                  //       })
                                                  //     )).values.toList()
                                                  //   ))
                                                  // ]),
                                                  children: myRowChildren),
                                            ]),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Container(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 90,
                                        height:
                                            SizeConfig.safeBlockVertical * 8,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Ticket Rate',
                                                          style: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Spacer(),
                                                      Text(
                                                          'Rs. ' +
                                                              widget.price
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  3,
                                                              color:
                                                                  Colors.red))
                                                    ]),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('No. Of Ticket',
                                                          style: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Spacer(),
                                                      BlocBuilder<CounterCubit,
                                                          int>(
                                                        builder: (context, count) => Center(
                                                            child: Text(
                                                                '$count',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        SizeConfig.safeBlockHorizontal *
                                                                            3,
                                                                    color: Colors
                                                                        .red))),
                                                      ),
                                                    ]),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Total Rate',
                                                          style: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      Spacer(),
                                                      BlocBuilder<CounterCubit,
                                                          int>(
                                                        builder: (context,
                                                                count) =>
                                                            Center(
                                                                child: Expanded(
                                                          flex: 1,
                                                          child: Text(
                                                              'Rs.' +
                                                                  '$count' *
                                                                      widget
                                                                          .price,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      SizeConfig
                                                                              .safeBlockHorizontal *
                                                                          3,
                                                                  color: Colors
                                                                      .red)),
                                                        )),
                                                      ),
                                                    ]),
                                              )
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 120.0),
                                      child: SizedBox(
                                        height: 60,
                                        width: double.infinity / 2,
                                        child: FlatButton(
                                          color: Color(0xff4c6792),
                                          textColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          onPressed: () {
                                            // print(totalAmount.toString());

                                            showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    SignUpAlertBox(),
                                                barrierDismissible: false);
                                          },
                                          child: Text(
                                            "Book Ticket",
                                            style: TextStyle(
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 1)
                                  ]),
                                ),
                              ),
                            );
                          })
                    ]),
                  ),
                )),
      ),
    );
  }
}
