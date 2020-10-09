import 'package:android_app/src/ui/signup_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:android_app/src/ui/bus_seat.dart';

class BusSeatBottomSheet extends StatefulWidget {
  @override
  _BusSeatBottomSheetState createState() => _BusSeatBottomSheetState();
}

class _BusSeatBottomSheetState extends State<BusSeatBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FlatButton(
        onPressed: () {
          _showBusSeatsBottomSheet(context);
          print('hello');
        },
        color: Color(0xff4c6792),
        highlightColor: Colors.green,
        child: Text(
          'View Seats',
          style: TextStyle(color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal * 5),
        ));
  }
}

void _showBusSeatsBottomSheet(BuildContext context) {
  SizeConfig().init(context);
  showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
            color: Color(0xff4c6792),
            height: SizeConfig.safeBlockVertical * 100,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 140.0),
                child: Divider(
                  thickness: 3,
                  color: Colors.white,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 15),
                        child: Row(
                          children: [
                            Text(
                              'Shakira Travels',
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: SizeConfig.safeBlockHorizontal * 4,
                          ),
                          Text(
                            '(Kathmandu- Pokhara)',
                            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: SizeConfig.safeBlockHorizontal * 4,
                          ),
                          Text('1st October 2020',
                              style:
                                  TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4, color: Colors.white))
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1),
                      Container(
                        height: SizeConfig.safeBlockVertical * 10,
                        width: SizeConfig.safeBlockHorizontal * 90,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Container(
                                    height: 30,
                                    width: 20,
                                
                                    decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)))),
                                Text('BOOKED SEAT',
                                    style: TextStyle(
                                        fontSize: SizeConfig.safeBlockHorizontal * 3,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Container(
                                    height: 30,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.teal[200],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)))),
                                Text('SELECTED SEAT',
                                    style: TextStyle(
                                        fontSize: SizeConfig.safeBlockHorizontal * 3,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 5),
                                child: Container(
                                    height: 30,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)))),
                              ),
                              Text('AVAILABLE SEAT',
                                  style: TextStyle(
                                      fontSize: SizeConfig.safeBlockHorizontal * 3,
                                      fontWeight: FontWeight.w400))
                            ],
                          )
                        ]),
                      )
                    ],
                  )),
              DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(children: [
                            Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: SizeConfig.safeBlockHorizontal * 90,
                                  height: SizeConfig.safeBlockVertical * 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget> [
                                        //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //2
                                          
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //3
                                          
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //4
                                          //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //5
                                          //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //6
                                          //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //7
                                          //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //8
                                          //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //9
                                          //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                        //10
                                          //First Row
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20),
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                            SizedBox(
                                              width: (MediaQuery.of(context).size.width / 20) * 2,
                                            ),
                                            BusSeat(),
                                            BusSeat(),
                                          ],
                                        ),
                                      ]),
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                              child: Container(
                                width: SizeConfig.safeBlockHorizontal * 90,
                                height: SizeConfig.safeBlockVertical * 10,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Ticket Rate',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Spacer(),
                                              Text('NPR. 1500',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig.safeBlockHorizontal * 3,
                                                      color: Colors.red))
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('No Of Ticket',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Spacer(),
                                              Text('3',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig.safeBlockHorizontal * 3,
                                                      color: Colors.red))
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Total Rate',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              Spacer(),
                                              Text('NPR. 4500',
                                                  style: TextStyle(
                                                      fontSize: SizeConfig.safeBlockHorizontal * 3,
                                                      color: Colors.red))
                                            ]),
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(height: SizeConfig.safeBlockVertical * 2),
                            FlatButton(
                              color: Color(0xff4c6792),
                              textColor: Colors.white,
                              padding: EdgeInsets.all(12.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => SignUpAlertBox(),
                                    barrierDismissible: false);
                              },
                              child: Text(
                                "Book Ticket",
                                style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4),
                              ),
                            ),
                            SizedBox(height: SizeConfig.safeBlockVertical * 1)
                          ]),
                        ),
                      ),
                    );
                  })
            ]),
          ));
}
