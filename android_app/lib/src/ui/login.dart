import 'package:android_app/src/bloc/login_bloc.dart';
import 'package:android_app/src/model/login.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/register.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  //static final url = 'http://192.168.1.68:8000/api/login/';
  static final url = 'http://192.168.1.68:8000/api/login/';
  
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool checkBoxValue = false;
  bool visible = false;
  bool _showPassword = false;

  errorMessage(BuildContext context) {
    scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        'Invalid Credentials! Try again.',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      ),
      backgroundColor: Color(0xff28d6e2),
      duration: Duration(seconds: 12),
    ));
  }

  goToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationBarPage()),
    );
  }

  Future<LoginModel> userLogin(String url, {Map body}) async {
    setState(() {
      visible = true;
    });

    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      print(statusCode);
      print(response.body);
      if (statusCode == 201) {
        setState(() {
          visible = false;
        });
        

        errorMessage(context);
      }

      return LoginModel.fromJson(json.decode(response.body));
    });
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    final data =
        MediaQuery.of(context); // variable to get the media screen size
    return Scaffold(
      key: scaffoldkey,
      appBar: MyAppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
        ),
        child: Stack(children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff4c6792),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 120.0, horizontal: 10),
                    child: Center(
                      child: Container(
                          width: data.size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff4c6792),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  height: SizeConfig.safeBlockVertical * 30,
                                  width: SizeConfig.safeBlockHorizontal * 100,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 35),
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        StreamBuilder<String>(
                                            stream: loginBloc.emailStream,
                                            builder: (context, snapshot) {
                                              return TextField(
                                                controller: emailController,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff4c6792)),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  onChanged:
                                                      loginBloc.emailChanged,
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                        Icons.email,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    hintText:
                                                        'matthewperry@gmail.com',
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    errorText: snapshot.error,
                                                    errorStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    labelText: 'Email address',
                                                    labelStyle: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xff4c6792),
                                                              width: 1.5),
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
                                                  controller: passwordController,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff4c6792)),
                                                  onChanged:
                                                      loginBloc.passwordChanged,
                                                  obscureText:
                                                      !this._showPassword,
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                        Icons.https,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    suffixIcon: IconButton(
                                                        icon: Icon(
                                                          Icons.remove_red_eye,
                                                          color: this
                                                                  ._showPassword
                                                              ? Color(
                                                                  0xff4c6792)
                                                              : Colors.grey,
                                                        ),
                                                        onPressed: () {
                                                          setState(() => this
                                                                  ._showPassword =
                                                              !this
                                                                  ._showPassword);
                                                        }),
                                                    hintText: '**********',
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    errorText: snapshot.error,
                                                    errorStyle: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    labelText: 'Password',
                                                    labelStyle: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff4c6792)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xff4c6792),
                                                              width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ));
                                            }),
                                      ]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Checkbox(
                                        hoverColor: Color(0xff28d6e2),
                                        activeColor: Colors.white,
                                        checkColor: Color(0xff28d6e2),
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
                                        fontSize: 23,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: StreamBuilder<bool>(
                                      stream: loginBloc.loginCheck,
                                      builder: (context, snapshot) {
                                        return FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: Colors.white,
                                          textColor: Color(0xff28d6e2),
                                          disabledColor: Colors.white70,
                                          disabledTextColor: Colors.black,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50.0, vertical: 15),
                                          splashColor: Colors.blueAccent,
                                          onPressed: snapshot.hasData
                                              ? () async {
                                                  print(snapshot);
                                                  LoginModel loginModel = new LoginModel(email: emailController.text, password: passwordController.text);
                                  
                                                  print(loginModel.toMap());

                                                  LoginModel getBody =
                                                      await userLogin(
                                                          LoginPage.url,
                                                          body: loginModel
                                                              .toMap());
                                                  print(getBody.email);

                                                  goToHomePage(context);
                                                }
                                              : null,
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff28d6e2).withAlpha(255),
                                      fontSize: 23),
                                ),
                                SizedBox(height: 8),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                    );
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: new TextSpan(
                                        style: TextStyle(fontSize: 22),
                                        children: [
                                          TextSpan(
                                              text: 'Don\'t have an account.  ',
                                              style: TextStyle(
                                                  color: Colors.white70
                                                      .withAlpha(255))),
                                          TextSpan(
                                              text: 'Register here',
                                              style: TextStyle(
                                                color: Color(0xff28d6e2)
                                                    .withAlpha(255),
                                                decoration:
                                                    TextDecoration.underline,
                                              ))
                                        ]),
                                  ),
                                ),
                                Visibility(
                                    visible: visible,
                                    child: Container(
                                        child: Center(
                                      child: CircularProgressIndicator(
                                          backgroundColor: Color(0xff28d6e2)),
                                    ))),
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
    );
  }
}
