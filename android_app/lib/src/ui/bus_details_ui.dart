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
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
      child: Container(
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
                          fontSize: SizeConfig.safeBlockHorizontal * 6,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: widget.busDetailsModel.vehicleType,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        color: Color(0xff28d6e2),
                      ))
                ]),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1.8),
              RichText(
                text: new TextSpan(children: [
                  TextSpan(
                      text: 'Services- ',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4.8,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: widget.busDetailsModel.services,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                        color: Color(0xff28d6e2),
                      ))
                ]),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
              RichText(
                text: new TextSpan(children: [
                  TextSpan(
                      text: 'Stoppage Points- ',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4.8,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: widget.busDetailsModel.stoppagePoints,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                        color: Color(0xff28d6e2),
                      ))
                ]),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
              RichText(
                text: new TextSpan(
                    style: TextStyle(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: 'Pick Up Time- ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 4.8)),
                      TextSpan(
                          text: '5:30 AM',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                            color: Color(
                              0xff28d6e2,
                            ),
                          ))
                    ]),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
              RichText(
                text: new TextSpan(
                    style: TextStyle(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: 'Drop Off Time- ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 4.8)),
                      TextSpan(
                          text: '6 PM',
                          style: TextStyle(
                            color: Color(0xff28d6e2),
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                          ))
                    ]),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 105.0),
                child: SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                  width: SizeConfig.screenWidth,
                  child: FlatButton(
                    color: Color(0xff4c6792),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusSeatBottomSheet(
                                  id: widget.busDetailsModel.vehicleId,
                                  name: widget.busDetailsModel.vehicleName,
                                  start_point:
                                      widget.busDetailsModel.startPoint,
                                  end_point: widget.busDetailsModel.endPoint,
                                  departure_date:
                                      widget.busDetailsModel.departureDate,
                                  row: widget.busDetailsModel.seatRow,
                                  column: widget.busDetailsModel.seatColumn,
                                  // layout: widget.busDetailsModel.seatLayout,
                                  price: widget.busDetailsModel.price,
                                )),
                      );
                    },
                    child: Text(
                      "View Seats",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical),
            ],
          ),
        ),
      ),
    );
  }
}
