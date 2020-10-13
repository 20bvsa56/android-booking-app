// import 'package:flutter/material.dart';
// import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

// class TicketDetailsUI extends StatefulWidget {
//   final String name, email, phoneNumber;

//   TicketDetailsUI({Key key, this.name, this.email, this.phoneNumber}) : super(key: key);
//   @override
//   _TicketDetailsUIState createState() => _TicketDetailsUIState();
// }

// class _TicketDetailsUIState extends State<TicketDetailsUI> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           body: FlutterTicketWidget(
//         width: 350.0,
//         height: 500.0,
//         isCornerRounded: true,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Container(
//                     width: 120.0,
//                     height: 25.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30.0),
//                       border: Border.all(width: 1.0, color: Colors.green),
//                     ),
//                     child: Center(
//                       child: Text(
//                         widget.name,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                         'SLM',
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Icon(
//                           Icons.flight_takeoff,
//                           color: Colors.pink,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Text(
//                           'BTL',
//                           style: TextStyle(
//                               color: Colors.black, fontWeight: FontWeight.bold),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Text(
//                   'Bus Ticket',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

