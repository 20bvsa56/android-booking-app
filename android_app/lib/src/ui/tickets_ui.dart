import 'package:android_app/src/model/tickets_model.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';

class TicketsUI extends StatefulWidget {
  final TicketsModel ticketsModel;

  TicketsUI({Key key, this.ticketsModel}) : super(key: key);
  @override
  _TicketsUIState createState() => _TicketsUIState();
}

class _TicketsUIState extends State<TicketsUI> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 40,
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
              padding: const EdgeInsets.all(5.0),
              child: Column(children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Row(children: [
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 15,
                    child: Text('Ticket No.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff28d6e2),
                            fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  SizedBox(
                    child: Text('Route',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff28d6e2),
                            fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  SizedBox(
                    child: Text('Departure Date',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff28d6e2),
                            fontWeight: FontWeight.w500)),
                  ),
                ]),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Row(children: [
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 10,
                    child: Text(widget.ticketsModel.id.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff4c6792),
                            fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  SizedBox(
                    child: Text(widget.ticketsModel.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff4c6792),
                            fontWeight: FontWeight.w500)),
                  ),
                  Spacer(),
                  SizedBox(
                    child: Text(widget.ticketsModel.departureDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff4c6792),
                            fontWeight: FontWeight.w500)),
                  ),
                ]),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(thickness: 2),
                ),
                IconButton(
                    icon: Icon(Icons.expand_less_outlined),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 20),
                                child: Container(
                                  height: SizeConfig.safeBlockVertical * 45,
                                  width: SizeConfig.screenWidth,
                                  child: SingleChildScrollView(
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Bus Ticket',
                                            style: TextStyle(
                                                color: Color(0xff4c6792),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Spacer(),
                                          Container(
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    29,
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    4.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              border: Border.all(
                                                  width: SizeConfig
                                                          .safeBlockHorizontal /
                                                      2,
                                                  color: Color(0xff28d6e2)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.ticketsModel.vehicleType,
                                                style: TextStyle(
                                                    color: Color(0xff28d6e2),
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: SizeConfig.safeBlockVertical *
                                              1.5),
                                      Divider(
                                          thickness: 1,
                                          color: Color(0xff4c6792)),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40),
                                            child: Row(
                                              children: [
                                                Text(
                                                  widget.ticketsModel
                                                          .startPoint +
                                                      '  ',
                                                  style: TextStyle(
                                                    color: Color(0xff4c6792),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Icon(Icons.bus_alert,
                                                    color: Color(0xff28d6e2),
                                                    size: 25),
                                                Text(
                                                  '  ' +
                                                      widget.ticketsModel
                                                          .endPoint,
                                                  style: TextStyle(
                                                      color: Color(0xff4c6792),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                          thickness: 1,
                                          color: Color(0xff4c6792)),
                                      SizedBox(
                                          height: SizeConfig.safeBlockVertical *
                                              0.5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: SizeConfig
                                                        .safeBlockHorizontal *
                                                    40,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Ticket No.',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          widget.ticketsModel.id
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                      SizedBox(
                                                          height: SizeConfig
                                                                  .safeBlockVertical *
                                                              2),
                                                      Text(
                                                        'Date',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          widget.ticketsModel
                                                              .departureDate,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                      SizedBox(
                                                          height: SizeConfig
                                                                  .safeBlockVertical *
                                                              2),
                                                      Text(
                                                        'Email',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          widget.ticketsModel
                                                              .email,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                      SizedBox(
                                                          height: SizeConfig
                                                                  .safeBlockVertical *
                                                              1.5),
                                                      Text(
                                                        'Phone Number',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          widget.ticketsModel
                                                              .phoneNumber,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                      SizedBox(
                                                          height: SizeConfig
                                                                  .safeBlockVertical *
                                                              2),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                width: SizeConfig
                                                        .safeBlockHorizontal *
                                                    30,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Vehicle Name',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          widget.ticketsModel
                                                              .vehicleName,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                      SizedBox(
                                                          height: SizeConfig
                                                                  .safeBlockVertical *
                                                              2),
                                                      Text(
                                                        'Booked Seats',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          widget.ticketsModel
                                                              .allocatedSeats,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                          )),
                                                      SizedBox(
                                                          height: SizeConfig
                                                                  .safeBlockVertical *
                                                              2),
                                                      Text(
                                                        'Amount',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          'Rs. ' +
                                                              widget
                                                                  .ticketsModel
                                                                  .amount
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18)),
                                                      SizedBox(
                                                          height: SizeConfig
                                                                  .safeBlockVertical *
                                                              2),
                                                      Text(
                                                        'Total Amount',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                          'Rs. ' +
                                                              widget
                                                                  .ticketsModel
                                                                  .amount
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
              ])),
        ),
      ),
    );
  }
}
