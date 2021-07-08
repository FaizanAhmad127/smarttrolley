import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttrolley/Change%20Notifiers%20Provider/STBottomNavBarCN.dart';
import 'package:smarttrolley/Custom%20Widgets/AppBar.dart';
import 'package:smarttrolley/Views/Dashboard.dart';
import 'package:smarttrolley/Views/DifferentListMaking.dart';
import 'package:smarttrolley/Views/HistoryScreen.dart';
import 'package:smarttrolley/Views/MyListScreen.dart';
import 'package:smarttrolley/Views/ProfileScreen.dart';
import 'package:smarttrolley/Views/STBottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ChangeNotifierProvider(
      create: (context) => STBottomNavBarCN(),
      child: Scaffold(
        appBar: AppBarNormalUI().myAppBar(),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: STBottomNavigationBar(),
        body: Consumer<STBottomNavBarCN>(builder: (context, bottomNavBarCN, _) {
          if (bottomNavBarCN.getHomeScreen == true) {
            return Dashboard();
          } else if (bottomNavBarCN.getProfileScreen == true) {
            return ProfileScreen();
          } else if (bottomNavBarCN.getMyListScreen == true) {
            return DifferentListMaking();
          } else if (bottomNavBarCN.getHistoryScreen == true) {
            return HistoryScreen();
          } else {
            return Container();
          }
        }),
      ),
    ));
  }
}
