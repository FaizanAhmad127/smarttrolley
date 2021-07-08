import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarttrolley/Views/HomeScreen.dart';
import 'package:smarttrolley/Views/MyListScreen.dart';
import 'package:smarttrolley/Views/SignUpScreen.dart';

import 'Views/LoginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(SmartTrolley());
}

class SmartTrolley extends StatelessWidget {
  const SmartTrolley({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .opaque, //Opaque targets can be hit by hit tests, causing them to both receive events within their bounds and prevent targets visually behind them from also receiving events.
      onTap: () {
        FocusScope.of(context).requestFocus(
            new FocusNode()); // to keep down the soft keypad after done typing in textfield etc
        print("Tapped, main.dart");
      },
      child: MaterialApp(
        debugShowCheckedModeBanner:
            false, //remove the yellow debug line from top right corner of an app
        showPerformanceOverlay: false, // remove the performance overlay
        builder: BotToastInit(), //initialize the toast so we can use it.
        navigatorObservers: [BotToastNavigatorObserver()],
        initialRoute: "LoginScreen",
        routes: {
          "LoginScreen": (context) => LoginScreen(),
          "SignUpScreen": (context) => SignUpScreen(),
          "HomeScreen": (context) => HomeScreen(),
          "MyListScreen": (context) => MyListScreen(),
        },
      ),
    );
  }
}
