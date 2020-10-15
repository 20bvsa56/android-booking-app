import 'package:android_app/src/bloc/register_bloc.dart';
import 'package:android_app/src/model/register.dart';
import 'package:android_app/src/ui/account.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:android_app/src/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  // static final url = 'http://192.168.254.78:8000/api/register/';
  static final url = 'http://192.168.1.101:8000/api/register/';
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool checkBoxValue = false;
  bool visible = false;
  bool _showPassword = false;

  Future<RegisterModel> userRegistration(String url, {Map body}) async {
    // Showing CircularProgressIndicator using state.
    setState(() {
      visible = true;
    });

    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode == 201) {
        setState(() {
          visible = false;
        });
        // throw new Exception("Error while fetching data");
      }

      return RegisterModel.fromJson(json.decode(response.body));
    });
  }

  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final TextEditingController phoneNumberController =
      new TextEditingController();

  registeredMessage(BuildContext context) {
    scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text(
        'Registration Suuccessful. You can login now.',
        style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            fontWeight: FontWeight.w300),
      ),
      backgroundColor: Color(0xff28d6e2),
      duration: Duration(seconds: 12),
    ));
  }

  List<RegisterModel> userDetailsList = [];

  Future<List<RegisterModel>> userDetails(int id) async {
    var data =
        await http.get('http://192.168.1.101:8000/api/getUsersData?id=$id');
    var jsonData = json.decode(data.body);

    // print(start_point);

    for (var i = 0; i < jsonData.length; i++) {
      final detail = RegisterModel.fromJson(jsonData[i]);
      userDetailsList.add(detail);
      print(userDetailsList.length.toString());
    }
    return userDetailsList;
  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = RegisterBloc();

    return Scaffold(
        key: scaffoldkey,
        appBar: MyAppBar(),
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
                            vertical: 7.0, horizontal: 20),
                        child: Center(
                          child: Container(
                              width: SizeConfig.screenWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 3),
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
                                      height: SizeConfig.safeBlockVertical * 71,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 100,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 40),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              StreamBuilder<String>(
                                                  stream:
                                                      registerBloc.fnameStream,
                                                  builder: (context, snapshot) {
                                                    return TextField(
                                                        controller:
                                                            firstNameController,
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal *
                                                                5,
                                                            color: Color(
                                                                0xff4c6792)),
                                                        onChanged: registerBloc
                                                            .fnameChanged,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Matthew',
                                                          hintStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          errorText:
                                                              snapshot.error,
                                                          errorStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          labelText:
                                                              'First Name',
                                                          labelStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xff4c6792),
                                                                    width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ));
                                                  }),
                                              SizedBox(
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      2.8),
                                              StreamBuilder<String>(
                                                  stream:
                                                      registerBloc.lnameStream,
                                                  builder: (context, snapshot) {
                                                    return TextField(
                                                        controller:
                                                            lastNameController,
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal *
                                                                5,
                                                            color: Color(
                                                                0xff4c6792)),
                                                        onChanged: registerBloc
                                                            .lnameChanged,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Perry',
                                                          hintStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          errorText:
                                                              snapshot.error,
                                                          errorStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          labelText:
                                                              'Last Name',
                                                          labelStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xff4c6792),
                                                                    width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ));
                                                  }),
                                              SizedBox(
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      2.8),
                                              StreamBuilder<String>(
                                                  stream:
                                                      registerBloc.emailStream,
                                                  builder: (context, snapshot) {
                                                    return TextField(
                                                        controller:
                                                            emailController,
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal *
                                                                5,
                                                            color: Color(
                                                                0xff4c6792)),
                                                        onChanged: registerBloc
                                                            .emailChanged,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'matthewperry@gmail.com',
                                                          hintStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          errorText:
                                                              snapshot.error,
                                                          errorStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          labelText:
                                                              'Email address',
                                                          labelStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xff4c6792),
                                                                    width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ));
                                                  }),
                                              SizedBox(
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      2.8),
                                              StreamBuilder<String>(
                                                  stream: registerBloc
                                                      .passwordStream,
                                                  builder: (context, snapshot) {
                                                    return TextField(
                                                        controller:
                                                            passwordController,
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal *
                                                                5,
                                                            color: Color(
                                                                0xff4c6792)),
                                                        obscureText:
                                                            !this._showPassword,
                                                        onChanged: registerBloc
                                                            .passwordChanged,
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon:
                                                              IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color: this
                                                                            ._showPassword
                                                                        ? Color(
                                                                            0xff4c6792)
                                                                        : Colors
                                                                            .grey,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    setState(() =>
                                                                        this._showPassword =
                                                                            !this._showPassword);
                                                                  }),
                                                          hintText:
                                                              '**********',
                                                          hintStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          errorText:
                                                              snapshot.error,
                                                          errorStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          labelText: 'Password',
                                                          labelStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xff4c6792),
                                                                    width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ));
                                                  }),
                                              SizedBox(
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      2.8),
                                              StreamBuilder<String>(
                                                  stream: registerBloc
                                                      .confirmPasswordStream,
                                                  builder: (context, snapshot) {
                                                    return TextField(
                                                        controller:
                                                            confirmPasswordController,
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal *
                                                                5,
                                                            color: Color(
                                                                0xff4c6792)),
                                                        obscureText:
                                                            !this._showPassword,
                                                        onChanged: registerBloc
                                                            .confirmPasswordChanged,
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon:
                                                              IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color: this
                                                                            ._showPassword
                                                                        ? Color(
                                                                            0xff4c6792)
                                                                        : Colors
                                                                            .grey,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    setState(() =>
                                                                        this._showPassword =
                                                                            !this._showPassword);
                                                                  }),
                                                          hintText:
                                                              '**********',
                                                          hintStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          errorText:
                                                              snapshot.error,
                                                          errorStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          labelText:
                                                              'Confirm Password',
                                                          labelStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xff4c6792),
                                                                    width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ));
                                                  }),
                                              SizedBox(
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      2.8),
                                              StreamBuilder<String>(
                                                  stream: registerBloc
                                                      .phoneNumberStream,
                                                  builder: (context, snapshot) {
                                                    return TextField(
                                                        controller:
                                                            phoneNumberController,
                                                        style: TextStyle(
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal *
                                                                5,
                                                            color: Color(
                                                                0xff4c6792)),
                                                        onChanged: registerBloc
                                                            .phoneNumberChanged,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              '9999999999',
                                                          hintStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          errorText:
                                                              snapshot.error,
                                                          errorStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          labelText:
                                                              'Phone Number',
                                                          labelStyle: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .safeBlockHorizontal *
                                                                  4,
                                                              color: Color(
                                                                  0xff4c6792)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xff4c6792),
                                                                    width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ));
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 2.8),
                                    Center(
                                      child: StreamBuilder<bool>(
                                          stream: registerBloc.registerCheck,
                                          builder: (context, snapshot) {
                                            return FlatButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              color: Colors.white,
                                              textColor: Color(0xff28d6e2),
                                              disabledColor: Colors.white70,
                                              disabledTextColor: Colors.black,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 50.0,
                                                  vertical: 15),
                                              splashColor: Colors.blueAccent,
                                              onPressed: snapshot.hasData
                                                  ? () async {
                                                      RegisterModel registerModel = new RegisterModel(
                                                          firstName:
                                                              firstNameController
                                                                  .text,
                                                          lastName:
                                                              lastNameController
                                                                  .text,
                                                          email: emailController
                                                              .text,
                                                          password:
                                                              passwordController
                                                                  .text,
                                                          confirmPassword:
                                                              confirmPasswordController
                                                                  .text,
                                                          phoneNumber:
                                                              phoneNumberController
                                                                  .text);

                                                      RegisterModel check =
                                                          await userRegistration(
                                                              RegisterPage.url,
                                                              body:
                                                                  registerModel
                                                                      .toMap());

                                                      print(check.firstName);
                                                      registeredMessage(
                                                          context);

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => AccountPage(
                                                                firstName:
                                                                    firstNameController
                                                                        .text,
                                                                lastName:
                                                                    lastNameController
                                                                        .text,
                                                                email:
                                                                    emailController
                                                                        .text,
                                                                phoneNumber:
                                                                    phoneNumberController
                                                                        .text)),
                                                      );

                                                      setState(() {
                                                        visible = false;
                                                      });
                                                    }
                                                  : null,
                                              child: Text(
                                                "Register Account",
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        6,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            );
                                          }),
                                    ),
                                    Visibility(
                                        visible: visible,
                                        child: Container(
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                          backgroundColor: Color(0xff28d6e2),
                                        )))),
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
