import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/pages/add_new_brew.dart';
import 'package:alebrew/src/ui/pages/trash.dart';
import 'package:alebrew/src/ui/pages/view_all.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class BrewProvider with ChangeNotifier {
  static DateTime _now = DateTime.now().toLocal();
  static String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);
  String currentNavigation = "View All";

  void addBrewToDatabase(String brewName, [bool firstTime = false]) async {
    Box<dynamic> _brewery = await Hive.openBox<Brew>("Brewery");
    String _brewName = brewName.trim();

    _brewery.add(Brew(_brewName, _lastEdited));
    notifyListeners();
  }

  void updateBrewName(Box<Brew> box, int index, String newName) {
    box.getAt(index).name = newName.trim();
    box.getAt(index).lastEdited = _lastEdited;

    box.getAt(index).save();
    notifyListeners();
  }

  void deleteBrew(Box<Brew> box, int index) async {
    Box<dynamic> _trash = await Hive.openBox<Brew>("Trash");
    var _tempBrew = box.getAt(index);
    box.getAt(index).delete();

    _tempBrew.lastEdited = _lastEdited;
    _trash.add(_tempBrew);
    notifyListeners();
  }

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
