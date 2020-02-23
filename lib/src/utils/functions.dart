import 'package:alebrew/src/models/brew.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Functions {
  static DateTime _now = DateTime.now().toLocal();
  static String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);
  Brew currentBrew;

  static void addBrewToDatabase(String brewName,
      [bool firstTime = false]) async {
    Box<dynamic> _brewery = await Hive.openBox<Brew>("Brewery");
    String _brewName = brewName.trim();

    _brewery.add(Brew(_brewName, _lastEdited));
  }

  static void updateBrewName(Box<Brew> box, int index, String newName) {
    box.getAt(index).name = newName.trim();
    box.getAt(index).lastEdited = _lastEdited;

    box.getAt(index).save();
  }

  static void restoreBrew(Box<Brew> box, int index) async {
    Box<dynamic> _brewery = await Hive.openBox<Brew>("Brewery");
    var _tempBrew = box.getAt(index);
    box.getAt(index).delete();

    _tempBrew.lastEdited = _lastEdited;
    _brewery.add(_tempBrew);
  }

  static void deleteBrew(Box<Brew> box, int index) async {
    Box<dynamic> _trash = await Hive.openBox<Brew>("Trash");
    var _tempBrew = box.getAt(index);
    box.getAt(index).delete();

    _tempBrew.lastEdited = _lastEdited;
    _trash.add(_tempBrew);
  }

  static void permanentDeleteBrew(Box<Brew> box, int index) async {
    box.getAt(index).delete();
  }

  static void cleanTrashCan() {
    Hive.box<Brew>("Trash").clear();
  }
}
