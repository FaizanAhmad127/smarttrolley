import 'package:flutter/material.dart';
import 'package:smarttrolley/constants.dart';

class AppBarNormalUI {
  AppBar myAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: greenColor,
      title: Text(
        "The Smart Trolley App",
        style: webooktextStyle,
      ),
    );
  }
}
