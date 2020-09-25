import 'package:android_app/src/bloc/register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool checkBoxValue = false;

  registeredMessage(BuildContext context) {
    //   Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginPage()),
    // );
    scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Registration Suuccessful. You can login now.', style: TextStyle(fontSize: 14),),backgroundColor: Color(0xfff2a407), duration: Duration(seconds: 10),));

  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = RegisterBloc();
    final data =
        MediaQuery.of(context); // variable to get the media screen size
    return Scaffold(
      key: scaffoldkey,
      // backgroundColor: Color(0xffdedcdc),
      // appBar: AppBar(title: Text('Jhun Jhun Travels'),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Color(0xfff2a407),
        title: Text(
          'Jhun Jhun Travels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            height: data.size.height / 1.2,
            width: data.size.width / 1.2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      child: Image.asset('lib/src/images/nature.jpg'),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                      width: data.size.width / 1.3,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 20),
                            StreamBuilder<String>(
                                stream: registerBloc.fnameStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                      onChanged: registerBloc.fnameChanged,
                                      decoration: InputDecoration(
                                        errorText: snapshot.error,
                                        labelText: '   First Name',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black12,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ));
                                }),
                            SizedBox(height: 15),
                            StreamBuilder<String>(
                                stream: registerBloc.lnameStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                      onChanged: registerBloc.lnameChanged,
                                      decoration: InputDecoration(
                                        errorText: snapshot.error,
                                        labelText: '   Last Name',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black12,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ));
                                }),
                            SizedBox(height: 15),
                            StreamBuilder<String>(
                                stream: registerBloc.emailStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                      onChanged: registerBloc.emailChanged,
                                      decoration: InputDecoration(
                                        errorText: snapshot.error,
                                        labelText: '   Email Address',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black12,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ));
                                }),
                            SizedBox(height: 12),
                            // Text(
                            //   '  Role:',
                            //   style: TextStyle(
                            //     color: Colors.black,
                            //     fontSize: 20,
                            //   ),
                            // ),
                            // Row(
                            //   children: [
                            //     StreamBuilder<bool>(
                            //         stream: registerBloc.roleStream,
                            //         builder: (context, snapshot) {
                            //           return new Radio(
                            //             value: 0,
                            //             groupValue: 0,
                            //             onChanged:
                            //                 registerBloc.roleChanged(true),
                            //           );
                            //         }),
                            //     new Text(
                            //       'Customer',
                            //       style: new TextStyle(fontSize: 16.0),
                            //     ),
                            //     StreamBuilder<bool>(
                            //         stream: registerBloc.roleStream,
                            //         builder: (context, snapshot) {
                            //           return new Radio(
                            //             value: 1,
                            //             groupValue: 1,
                            //             onChanged:
                            //                 registerBloc.roleChanged(false),
                            //           );
                            //         }),
                            //     new Text(
                            //       'Travel Agent',
                            //       style: new TextStyle(
                            //         fontSize: 16.0,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: 12),
                            StreamBuilder<String>(
                                stream: registerBloc.passwordStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    obscureText: true,
                                      onChanged: registerBloc.passwordChanged,
                                      decoration: InputDecoration(
                                        
                                        errorText: snapshot.error,
                                        labelText: '   Password',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black12,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ));
                                }),
                            SizedBox(height: 15),
                            StreamBuilder<String>(
                                stream: registerBloc.confirmPasswordStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    obscureText: true,
                                      onChanged:
                                          registerBloc.confirmPasswordChanged,
                                      decoration: InputDecoration(
                                        errorText: snapshot.error,
                                        labelText: '   Confirm Password',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black12,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ));
                                }),
                            SizedBox(height: 15),
                            StreamBuilder<String>(
                                stream: registerBloc.phoneNumberStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                      onChanged:
                                          registerBloc.phoneNumberChanged,
                                      decoration: InputDecoration(
                                        errorText: snapshot.error,
                                        labelText: '   Phone Number',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black12,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ));
                                }),
                            SizedBox(height: 15),
                            Center(
                              child: StreamBuilder<bool>(
                                  stream: registerBloc.registerCheck,
                                  builder: (context, snapshot) {
                                    return FlatButton(
                                      color: Color(0xfff2a407),
                                      textColor: Colors.white,
                                      disabledColor: Color(0xffd19824),
                                      disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      onPressed: snapshot.hasData
                                          ? () => registeredMessage(context)
                                          : null,
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
