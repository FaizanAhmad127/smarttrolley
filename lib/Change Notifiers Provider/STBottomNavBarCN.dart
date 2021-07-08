import 'package:flutter/foundation.dart';

class STBottomNavBarCN with ChangeNotifier {
  bool homeScreen = true;
  bool profileScreen = false;
  bool myListScreen = false;
  bool historyScreen = false;

  bool get getHomeScreen => homeScreen;
  bool get getProfileScreen => profileScreen;
  bool get getMyListScreen => myListScreen;
  bool get getHistoryScreen => historyScreen;
  set setHomeScreen(bool a) {
    homeScreen = a;
    if (a == true) {
      profileScreen = false;
      myListScreen = false;
      historyScreen = false;
    }
    notifyListeners();
  }

  set setProfileScreen(bool a) {
    profileScreen = a;
    if (a == true) {
      homeScreen = false;
      myListScreen = false;
      historyScreen = false;
    }
    notifyListeners();
  }

  set setMyListScreen(bool a) {
    myListScreen = a;
    if (a == true) {
      profileScreen = false;
      homeScreen = false;
      historyScreen = false;
    }
    notifyListeners();
  }

  set setHistoryScreen(bool a) {
    historyScreen = a;
    if (a == true) {
      profileScreen = false;
      homeScreen = false;
      myListScreen = false;
    }
    notifyListeners();
  }
}
