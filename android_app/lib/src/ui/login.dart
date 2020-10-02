import 'package:android_app/src/bloc/login_bloc.dart';
import 'package:android_app/src/ui/register.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkBoxValue = false;

  goToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationBarPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    final data =
        MediaQuery.of(context); // variable to get the media screen size
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 25,
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Jhun Jhun Travels',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
          ),
          child: Center(
            child: Stack(children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'lib/src/images/nature.jpg',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 120.0, horizontal: 20),
                        child: Center(
                          child: Container(
                              width: data.size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20),
                                    StreamBuilder<String>(
                                        stream: loginBloc.emailStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onChanged: loginBloc.emailChanged,
                                              decoration: InputDecoration(
                                                hintText: 'abc@gmail.com',
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                errorText: snapshot.error,
                                                errorStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                labelText: 'Email address',
                                                labelStyle: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white70),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white70,
                                                      width: 2.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ));
                                        }),
                                    SizedBox(height: 20),
                                    StreamBuilder<String>(
                                        stream: loginBloc.passwordStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              onChanged:
                                                  loginBloc.passwordChanged,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                hintText: '**********',
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                errorText: snapshot.error,
                                                errorStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                labelText: 'Password',
                                                labelStyle: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white70),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white70,
                                                      width: 2.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ));
                                        }),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Checkbox(
                                            hoverColor: Colors.orange,
                                            activeColor: Colors.white,
                                            checkColor: Colors.orange,
                                            value: checkBoxValue,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkBoxValue = value;
                                                print(value);
                                              });
                                            }),
                                        Text(
                                          'Remember Me',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Center(
                                      child: StreamBuilder<bool>(
                                          stream: loginBloc.loginCheck,
                                          builder: (context, snapshot) {
                                            return FlatButton(
                                              color: Colors.white,
                                              textColor: Color(0xfff2a407),
                                              disabledColor: Colors.white70,
                                              disabledTextColor: Colors.black,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 50.0,
                                                  vertical: 15),
                                              splashColor: Colors.blueAccent,
                                              onPressed: snapshot.hasData
                                                  ? () => goToHomePage(context)
                                                  : null,
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                    fontSize: 25.0,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color:
                                              Color(0xfff2a407).withAlpha(255),
                                          fontSize: 23),
                                    ),
                                    SizedBox(height: 8),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()),
                                        );
                                      },
                                      child: RichText(
                                        text: new TextSpan(
                                            style: TextStyle(fontSize: 22),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      'Don\'t have an account.  ',
                                                  style: TextStyle(
                                                      color: Colors.white70
                                                          .withAlpha(255))),
                                              TextSpan(
                                                  text: 'Register here',
                                                  style: TextStyle(
                                                    color: Color(0xfff2a407)
                                                        .withAlpha(255),
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ))
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
