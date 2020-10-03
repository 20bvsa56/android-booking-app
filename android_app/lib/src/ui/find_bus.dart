import 'package:flutter/material.dart';
import 'bus_seat_bottom_sheet.dart';

class FindBus extends StatefulWidget {
  FindBus({Key key}) : super(key: key);

  @override
  _FindBusState createState() => _FindBusState();
}

class _FindBusState extends State<FindBus> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Container(
            width: data.size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: new TextSpan(children: [
                      TextSpan(
                          text: 'Shakira Travels ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '(BA 1 GHA 8978)',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  Text('Deluxe Bus',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  SizedBox(height: 10),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Pick Up Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '5:30 AM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Drop Off Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '6 PM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  BusSeatBottomSheet()
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Container(
            width: data.size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: new TextSpan(children: [
                      TextSpan(
                          text: 'Shakira Travels ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '(BA 1 GHA 8978)',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  Text('Deluxe Bus',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  SizedBox(height: 10),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Pick Up Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '5:30 AM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Drop Off Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '6 PM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  BusSeatBottomSheet()
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Container(
            width: data.size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: new TextSpan(children: [
                      TextSpan(
                          text: 'Shakira Travels ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '(BA 1 GHA 8978)',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  Text('Deluxe Bus',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  SizedBox(height: 10),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Pick Up Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '5:30 AM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Drop Off Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '6 PM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  BusSeatBottomSheet()
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Container(
            width: data.size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: new TextSpan(children: [
                      TextSpan(
                          text: 'Shakira Travels ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '(BA 1 GHA 8978)',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  Text('Deluxe Bus',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  SizedBox(height: 10),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Pick Up Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '5:30 AM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Drop Off Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '6 PM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  BusSeatBottomSheet()
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Container(
            width: data.size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: new TextSpan(children: [
                      TextSpan(
                          text: 'Shakira Travels ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '(BA 1 GHA 8978)',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  Text('Deluxe Bus',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  SizedBox(height: 10),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Pick Up Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '5:30 AM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text:
                        new TextSpan(style: TextStyle(fontSize: 17), children: [
                      TextSpan(
                          text: 'Drop Off Time: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '6 PM',
                          style: TextStyle(
                            color: Color(0xfff2a407),
                          ))
                    ]),
                  ),
                  SizedBox(height: 10),
                  BusSeatBottomSheet()
                ],
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
