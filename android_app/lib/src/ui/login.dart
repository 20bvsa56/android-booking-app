import 'package:android_app/src/bloc/login_bloc.dart';
import 'package:android_app/src/ui/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkBoxValue = false;

  goToHomePage(BuildContext context) {
     // Navigate to the main view screen using a named route '/navbarpage'.
    Navigator.pushNamed(context, '/navbarpage');
   
    // scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Registration Suuccessful. You can login now.')));
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    final data =
        MediaQuery.of(context); // variable to get the media screen size
    return Scaffold(
      // backgroundColor: Color(0xffdedcdc),
      // appBar: AppBar(title: Text('Jhun Jhun Travels'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 25,
       
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
                      // height: data.size.height / 1.3,
                      width: data.size.width / 1.3,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 20),
                            StreamBuilder<String>(
                                stream: loginBloc.emailStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: loginBloc.emailChanged,
                                      decoration: InputDecoration(
                                        hintText: '  abc@gmail.com',
                                        errorText: snapshot.error,
                                        labelText: '   Email address',
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
                                stream: loginBloc.passwordStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                      onChanged: loginBloc.passwordChanged,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        errorText: snapshot.error,
                                        hintText: '   ************',
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
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                    value: checkBoxValue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkBoxValue = value;
                                        print(value);
                                      });
                                    }),
                                Text(
                                  'Remember Me',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: StreamBuilder<bool>(
                                  stream: loginBloc.loginCheck,
                                  builder: (context, snapshot) {
                                    return FlatButton(
                                      color: Color(0xfff2a407),
                                      textColor: Colors.white,
                                      disabledColor: Color(0xffd19824),
                                      disabledTextColor: Colors.black,
                                      padding: EdgeInsets.all(8.0),
                                      splashColor: Colors.blueAccent,
                                      onPressed: snapshot.hasData
                                          ? () => goToHomePage(context)
                                          : null,
                                      child: Text(
                                        "Login",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Color(0xfff2a407), fontSize: 15),
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
                                text: new TextSpan(
                                    style: TextStyle(fontSize: 15),
                                    children: [
                                      TextSpan(
                                          text: 'Don\'t have an account.',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: 'Register here',
                                          style: TextStyle(
                                            color: Color(0xfff2a407),
                                            decoration:
                                                TextDecoration.underline,
                                          ))
                                    ]),
                              ),
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
