import 'package:android_app/src/model/bus_details_model.dart';
import 'package:android_app/src/ui/bus_seat_bottom_sheet.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';

class BusDetailsUI extends StatefulWidget {
  final BusDetailsModel busDetailsModel;

  BusDetailsUI({Key key, this.busDetailsModel}) : super(key: key);
  @override
  _BusDetailsUIState createState() => _BusDetailsUIState();
}

class _BusDetailsUIState extends State<BusDetailsUI> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Padding(
      padding:
          const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
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
                      text: widget.busDetailsModel.vehicleName + '  ',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: widget.busDetailsModel.vehicleType,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff28d6e2),
                      ))
                ]),
              ),
              SizedBox(height: 10),
              RichText(
                text: new TextSpan(children: [
                  TextSpan(
                      text: 'Services- ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: widget.busDetailsModel.services,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff28d6e2),
                      ))
                ]),
              ),
              SizedBox(height: 10),
              RichText(
                text: new TextSpan(children: [
                  TextSpan(
                      text: 'Stoppage Points- ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: widget.busDetailsModel.stoppagePoints,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff28d6e2),
                      ))
                ]),
              ),
              SizedBox(height: 10),
              RichText(
                text: new TextSpan(
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: 'Pick Up Time- ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '5:30 AM',
                          style: TextStyle(
                            color: Color(
                              0xff28d6e2,
                            ),
                          ))
                    ]),
              ),
              SizedBox(height: 10),
              RichText(
                text: new TextSpan(
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: 'Drop Off Time- ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '6 PM',
                          style: TextStyle(
                            color: Color(0xff28d6e2),
                          ))
                    ]),
              ),
              SizedBox(height: 15),
              FlatButton(
                  onPressed: () {
                    // _showBusSeatsBottomSheet(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusSeatBottomSheet(
                                id: widget.busDetailsModel.vehicleId,
                                name: widget.busDetailsModel.vehicleName,
                                start_point: widget.busDetailsModel.startPoint,
                                end_point: widget.busDetailsModel.endPoint,
                                departure_date:
                                    widget.busDetailsModel.departureDate,
                                row: widget.busDetailsModel.seatRow.toString(),
                                column:
                                    widget.busDetailsModel.seatRow.toString(),
                                layout: widget.busDetailsModel.seatLayout
                                    .toString(),
                                price: widget.busDetailsModel.price,
                              )),
                    );
                  },
                  color: Color(0xff4c6792),
                  highlightColor: Colors.green,
                  child: Text(
                    'View Seats',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 5),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
