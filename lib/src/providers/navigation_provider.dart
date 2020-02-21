import 'package:alebrew/src/ui/pages/add_new_brew.dart';
import 'package:alebrew/src/ui/pages/trash.dart';
import 'package:alebrew/src/ui/pages/view_all.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String currentNavigation = "View All";

  Widget get getNavigation {
    if (currentNavigation == "New Brew") {
      return AddNewBrew();
    } else if (currentNavigation == "Trash") {
      return Trash();
    } else {
      return ViewAll();
    }
  }

  String get getNavigationTitle => currentNavigation;

  void updateNavigation(String navigation) {
    currentNavigation = navigation;
    notifyListeners();
  }
}