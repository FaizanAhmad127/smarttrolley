import 'package:flutter/material.dart';
import 'package:smarttrolley/Custom Widgets/AppBar.dart';
import 'package:smarttrolley/Custom Widgets/TextFieldWidget.dart';
import 'package:smarttrolley/Custom Widgets/BlackRoundedButton.dart';
import 'package:smarttrolley/constants.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;
    return Scaffold(
      appBar: AppBarNormalUI().myAppBar(),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.1025,
                  screenWidth * 0.08, screenWidth * 0.0769, screenWidth * 0.03),
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Sign Up here",
                          style: TextStyle(
                              color: purpleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.2,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ),
                      TextFieldWidget(
                        outsideText: 'Full Name',
                        hintText: 'Anthony Hofstad',
                        icon: Icons.account_box,
                      ),
                      TextFieldWidget(
                        outsideText: 'Phone Number',
                        hintText: '+923021234567',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      TextFieldWidget(
                        outsideText: 'Email',
                        hintText: 'abc@gmail.com',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFieldWidget(
                        outsideText: 'Password',
                        hintText: 'Password',
                        icon: Icons.enhanced_encryption,
                        obscureText: true,
                      ),
                      TextFieldWidget(
                        outsideText: 'Confirm Password',
                        hintText: 'Confirm Password',
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(
                        width: 0,
                        height: screenHeight * 0.05,
                      ),
                      Center(
                        child: PurpleRoundButton(
                            buttonText: "SIGN UP",
                            buttonHeight: 0.065,
                            buttonWidth: 0.8,
                            onPressed: () {}),
                      ),
                      SizedBox(
                        width: 0,
                        height: screenHeight * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an Account? ",
                            style: TextStyle(
                                color: purpleColor,
                                fontSize: 15,
                                letterSpacing: -0.2,
                                fontFamily: "Source Sans Pro"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'LoginScreen');
                            },
                            child: Text(
                              "Log In ",
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
