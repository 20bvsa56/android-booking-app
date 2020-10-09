import 'package:android_app/src/bloc/register_bloc.dart';
import 'package:android_app/src/model/register.dart';
import 'package:android_app/src/ui/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  static final url = 'http://192.168.254.78:8000/api/register/';
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool checkBoxValue = false;

  bool visible = false;

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
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      ),
      backgroundColor: Color(0xff28d6e2),
      duration: Duration(seconds: 12),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = RegisterBloc();
    final data =
        MediaQuery.of(context); // variable to get the media screen size
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
                            vertical: 20.0, horizontal: 20),
                        child: Center(
                          child: Container(
                              width: data.size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20),
                                    StreamBuilder<String>(
                                        stream: registerBloc.fnameStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              controller: firstNameController,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              onChanged:
                                                  registerBloc.fnameChanged,
                                              decoration: InputDecoration(
                                                hintText: 'Matthew',
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                errorText: snapshot.error,
                                                errorStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                labelText: 'First Name',
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
                                        stream: registerBloc.lnameStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              controller: lastNameController,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              onChanged:
                                                  registerBloc.lnameChanged,
                                              decoration: InputDecoration(
                                                hintText: 'Perry',
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                errorText: snapshot.error,
                                                errorStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                labelText: 'Last Name',
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
                                        stream: registerBloc.emailStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              controller: emailController,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              onChanged:
                                                  registerBloc.emailChanged,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'matthewperry@gmail.com',
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
                                        stream: registerBloc.passwordStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              controller: passwordController,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              obscureText: true,
                                              onChanged:
                                                  registerBloc.passwordChanged,
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
                                    SizedBox(height: 20),
                                    StreamBuilder<String>(
                                        stream:
                                            registerBloc.confirmPasswordStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              controller:
                                                  confirmPasswordController,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              obscureText: true,
                                              onChanged: registerBloc
                                                  .confirmPasswordChanged,
                                              decoration: InputDecoration(
                                                hintText: '**********',
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                errorText: snapshot.error,
                                                errorStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                labelText: 'Confirm Password',
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
                                        stream: registerBloc.phoneNumberStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                              controller: phoneNumberController,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                              onChanged: registerBloc
                                                  .phoneNumberChanged,
                                              decoration: InputDecoration(
                                                hintText: '9999999999',
                                                hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                errorText: snapshot.error,
                                                errorStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                labelText: 'Phone Number',
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
                                    SizedBox(height: 25),
                                    Center(
                                      child: StreamBuilder<bool>(
                                          stream: registerBloc.registerCheck,
                                          builder: (context, snapshot) {
                                            return FlatButton(
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

                                                      firstNameController
                                                          .clear();
                                                      lastNameController
                                                          .clear();
                                                      emailController.clear();
                                                      passwordController
                                                          .clear();
                                                      confirmPasswordController
                                                          .clear();
                                                      phoneNumberController
                                                          .clear();

                                                      setState(() {
                                                        visible = false;
                                                      });
                                                    }
                                                  : null,
                                              child: Text(
                                                "Register Account",
                                                style: TextStyle(
                                                    fontSize: 25.0,
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
