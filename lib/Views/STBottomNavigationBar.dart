import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smarttrolley/Change%20Notifiers%20Provider/STBottomNavBarCN.dart';
import 'package:smarttrolley/constants.dart';

class STBottomNavigationBar extends StatefulWidget {
  @override
  _STBottomNavigationBarState createState() => _STBottomNavigationBarState();
}

class _STBottomNavigationBarState extends State<STBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: greenColor,
        selectedItemBorderColor: orangeColor,
        selectedItemBackgroundColor: Colors.white,
        selectedItemIconColor: blackColor,
        selectedItemLabelColor: Colors.white,
        unselectedItemLabelColor: blackColor,
        unselectedItemIconColor: blackColor,
      ),
      selectedIndex: selectedIndex,
      onSelectTab: (index) {
        setState(() {
          selectedIndex = index;
        });
        if (selectedIndex == 0) {
          Provider.of<STBottomNavBarCN>(context, listen: false).setHomeScreen =
              true;
        } else if (selectedIndex == 1) {
          Provider.of<STBottomNavBarCN>(context, listen: false)
              .setMyListScreen = true;
        } else if (selectedIndex == 2) {
          Provider.of<STBottomNavBarCN>(context, listen: false)
              .setHistoryScreen = true;
        } else if (selectedIndex == 3) {
          Provider.of<STBottomNavBarCN>(context, listen: false)
              .setProfileScreen = true;
        }
      },
      items: [
        FFNavigationBarItem(
          iconData: FontAwesomeIcons.home,
          label: 'Home',
        ),
        FFNavigationBarItem(
          iconData: Icons.format_list_bulleted,
          label: 'My Lists',
        ),
        FFNavigationBarItem(
          iconData: Icons.history,
          label: 'History',
        ),
        FFNavigationBarItem(
          iconData: Icons.account_circle,
          label: 'Profile',
        ),
      ],
    );
  }
}
