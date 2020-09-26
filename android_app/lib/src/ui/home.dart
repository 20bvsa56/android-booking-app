import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    Widget imageCarousel = new Container(
        height: data.size.height / 4,
        width: data.size.width,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('lib/src/images/image_carousel/pokhara.jpg'),
            AssetImage('lib/src/images/image_carousel/kathmandu.jpg'),
            AssetImage('lib/src/images/image_carousel/chitwan.jpg'),
            AssetImage('lib/src/images/image_carousel/koshi.jpg'),
            AssetImage('lib/src/images/image_carousel/birgunj.jpg'),
          ],
          autoplay: true,
          dotSize: 8.0,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSpacing: 25.0,
          dotColor: Colors.white,
          indicatorBgPadding: 4.0,
          dotBgColor: Color(0xfff2a407).withOpacity(0.3),
          borderRadius: true,
        ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2a407),
        // automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xfff2a407),
      body: Column(
        children: [
          imageCarousel,
          SizedBox(height: 10),
          Container(
              child: Text(
            'Ticket',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ))
        ],
      ),
    );
  }
}
