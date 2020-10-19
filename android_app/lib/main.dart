import 'package:android_app/src/model/slider.dart';
import 'package:android_app/src/ui/bottom_navigation_bar.dart';
import 'package:android_app/src/ui/login.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.redAccent,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(),
            textTheme: ButtonTextTheme.accent,
          )),

      home: OnBoardingScreens(),
      // Starting the app with the "/" named route.
      // initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Login Page widget.
        // '/': (context) => LoginPage(),
        // When navigating to the "/navbarpage" route, build the navbarpage widget.
        '/navbarpage': (context) => App(),
        // When navigating to the "/navbarpage" route, build the Login widget.
        '/login': (context) => LoginPage()
      },
    );
  }
}

class OnBoardingScreens extends StatefulWidget {
  OnBoardingScreens({Key key}) : super(key: key);

  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: isCurrentPage
          ? SizeConfig.safeBlockVertical * 2
          : SizeConfig.safeBlockVertical * 1.5,
      width: isCurrentPage
          ? SizeConfig.safeBlockVertical * 2
          : SizeConfig.safeBlockVertical * 1.5,
      decoration: BoxDecoration(
          color: isCurrentPage
              ? Color(0xff4c6792)
              : Color(0xff28d6e2).withAlpha(100),
          borderRadius: BorderRadius.circular(2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff4c6792),
      body: PageView.builder(
        controller: _pageController,
        itemCount: slides.length,
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imagePath: slides[index].getImagePath(),
            title: slides[index].getTitle(),
            description: slides[index].getDescription(),
          );
        },
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              height: SizeConfig.safeBlockVertical * 9,
              width: SizeConfig.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        _pageController.animateToPage(slides.length - 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 3.2,
                            color: Color(0xff4c6792),
                            fontWeight: FontWeight.w900),
                      )),
                  Row(
                    children: [
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        _pageController.animateToPage(currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 3.2,
                            color: Color(0xff4c6792),
                            fontWeight: FontWeight.w900),
                      )),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => App()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.safeBlockVertical * 9,
                width: SizeConfig.screenWidth,
                color: Colors.white,
                child: Text('GET STARTED',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 4,
                        color: Color(0xff28d6e2),
                        fontWeight: FontWeight.w900)),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String imagePath, title, description;

  const SliderTile({Key key, this.imagePath, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: SizeConfig.safeBlockVertical * 30,
                width: SizeConfig.safeBlockHorizontal * 50,
                child: Image.asset(imagePath)),
            SizedBox(height: SizeConfig.safeBlockVertical * 10),
            Text(title,
                style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                        color: Color(0xff28d6e2),
                      ),
                    ],
                    fontSize: SizeConfig.safeBlockVertical * 5.8,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 2.8,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
