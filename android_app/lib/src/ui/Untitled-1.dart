import 'package:android_app/src/ui/signup_alert_dialog.dart';
import 'package:flutter/material.dart';

class BusSeatBottomSheet extends StatefulWidget {
  @override
  _BusSeatBottomSheetState createState() => _BusSeatBottomSheetState();
}

class _BusSeatBottomSheetState extends State<BusSeatBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  FlatButton(
                      onPressed: () {
                        _showBusSeatsBottomSheet(context);
                        print('hello');
                      },
                      color: Color(0xfff2a407),
                      highlightColor: Colors.green,
                      child: Text(
                        'View Seats',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ));
  }
}

void _showBusSeatsBottomSheet(BuildContext context) {
  final data = MediaQuery.of(context);
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.90,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: 
         Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('View Seats',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xfff2a407),
                        fontWeight: FontWeight.bold)),
              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Color(0xfff2a407),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
          Stack(
            children: [
              Container(
                height: data.size.height / 4.8,
                width: data.size.width,
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Text(
                              'Shakira Travels',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.orangeAccent,
                          ),
                          Text(
                            '(Kathmandu-Pokhara)',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.orangeAccent,
                          ),
                          Text('1st October 2020',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white))
                        ],
                      )
                    ],
                  )),
              SizedBox(width: 5),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child: Container(
                          child: Image.asset('lib/src/images/person.png',
                              height: 100)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                          child: Image.asset('lib/src/images/suitcases.png',
                              height: 80)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                      height: data.size.height / 13,
                      width: data.size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                      fontSize: 12,
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
                                      fontSize: 12,
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
                                    fontSize: 12, fontWeight: FontWeight.w400))
                          ],
                        )
                      ])),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              width: data.size.width,
              height: data.size.height / 2,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Icon(Icons.crop_din, color: Colors.red, size: 35),
                    Text(
                      '  Entry',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.data_usage, color: Colors.red, size: 35)
                  ]),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Container(
              width: data.size.width,
              height: data.size.height / 12,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TICKET RATE',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        Spacer(),
                        Text('NPR. 1500',
                            style: TextStyle(fontSize: 14, color: Colors.red))
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NO OF TICKET',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        Spacer(),
                        Text('3',
                            style: TextStyle(fontSize: 14, color: Colors.red))
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TOTAL RATE',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        Spacer(),
                        Text('NPR. 4500',
                            style: TextStyle(fontSize: 14, color: Colors.red))
                      ]),
                )
              ]),
            ),
          ),
          SizedBox(height: 15),
          FlatButton(
            color: Color(0xfff2a407),
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              showDialog(context: context,
              builder: (_) => SignUpAlertBox(),
              barrierDismissible: false);
            },
            child: Text(
              "Book Ticket",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10)
        ]),
      ),
    
  );
}