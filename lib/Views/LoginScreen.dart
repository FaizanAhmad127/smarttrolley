import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:smarttrolley/Custom Widgets/AppBar.dart';
import 'package:smarttrolley/Custom Widgets/BlackRoundedButton.dart';
import 'package:smarttrolley/Custom Widgets/TextFieldWidget.dart';
import 'package:smarttrolley/constants.dart';

//CREATE STREAMS THAT OTHER CAN LISTEN TO, SO THESE STREAMS ARE USED
// TO LISTEN TO DATA INPUT IN TEXTFIELDS IN TextFieldWidget.dart file.
StreamController<String> emailStreamController =
    StreamController<String>.broadcast();
StreamController<String> passwordStreamController =
    StreamController<String>.broadcast();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";

  bool obscureText = true;

  Color color = Colors.grey;

  String forgotPasswordValue = "";

  @override
  void initState() {
    super.initState();
    emailStreamController.stream.listen((value) {
      email = value;
    });
    passwordStreamController.stream.listen((value) {
      password = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    // emailStreamController.close();
    // passwordStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarNormalUI().myAppBar(),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.1025,
                  screenWidth * 0.0769,
                  screenWidth * 0.0769,
                  screenWidth * 0.051),
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Image.asset("images/logo.png"),
                      ),
                      Center(
                        child: Text(
                          "Login here",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.2,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ),
                      TextFieldWidget(
                        outsideText: 'Email',
                        hintText: 'abc@gmail.com',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        streamController: emailStreamController,
                      ),
                      TextFieldWidget(
                        outsideText: 'Password',
                        hintText: 'Password',
                        icon: Icons.enhanced_encryption,
                        obscureText: obscureText,
                        streamController: passwordStreamController,
                        suffixIcon: IconButton(
                          color: color,
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              if (obscureText == false) {
                                obscureText = true;
                                color = Colors.grey;
                              } else if (obscureText == true) {
                                obscureText = false;
                                color = Colors.blue;
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 0,
                        height: screenHeight * 0.07,
                      ),
                      Center(
                        child: PurpleRoundButton(
                            buttonText: "LOGIN",
                            buttonHeight: 0.065,
                            buttonWidth: 0.8,
                            onPressed: () {
                              Navigator.popAndPushNamed(context, "HomeScreen");
                            }),
                      ),
                      SizedBox(
                        width: 0,
                        height: screenHeight * 0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an Account? ",
                            style: TextStyle(
                                color: purpleColor,
                                fontSize: 15,
                                letterSpacing: -0.2,
                                fontFamily: "Source Sans Pro"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "SignUpScreen");
                            },
                            child: Text(
                              "Sign Up ",
                              style: TextStyle(
                                  color: greenColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.2,
                                  fontFamily: "Source Sans Pro"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
