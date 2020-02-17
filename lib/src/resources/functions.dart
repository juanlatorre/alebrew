import 'package:hive/hive.dart';

class Functions { 
  static void addBrewToDatabase(String brewName) async {
    var dataBox = await Hive.openBox("data");
    var brewBox = await Hive.openBox("brew");

    print(brewName);
  }
}