import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({Key key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return Container(
        height: data.size.height / 3.4,
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
  }
}
