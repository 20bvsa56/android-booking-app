import 'package:android_app/src/model/slider.dart';
import 'package:android_app/src/ui/bottom_nav_bar.dart';
import 'package:android_app/src/ui/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/navbarpage': (context) => NavigationBarPage(),
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
      height: isCurrentPage ? 15 : 10,
      width: isCurrentPage ? 15 : 10,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.blueGrey[400] : Colors.grey[400],
          borderRadius: BorderRadius.circular(2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
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
                            fontSize: 20,
                            color: Colors.blueGrey,
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
                            fontSize: 20,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900),
                      )),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigationBarPage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Text('GET STARTED',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.teal,
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
    final data = MediaQuery.of(context).size;
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: data.height / 2,
                width: data.width / 2,
                child: Image.asset(imagePath)),
            SizedBox(height: 15),
            Text(title,
                style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1, 5),
                        blurRadius: 3.0,
                        color: Colors.brown,
                      ),
                    ],
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }
}
