import 'package:alebrew/src/models/brew.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Functions { 
  static void addBrewToDatabase(String brewName, [bool firstTime = false]) async {
    Box<dynamic> _brewery = await Hive.openBox<Brew>("Brewery");
    String _brewName = brewName.trim();


    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);

    _brewery.add(Brew(_brewName, _lastEdited));

    print(_brewery.values);
  }

  static void updateBrewName(Box<Brew> box, int index, String newName) {
    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);
    
    box.getAt(index).name = newName.trim();
    box.getAt(index).lastEdited = _lastEdited;

    box.getAt(index).save();
  }

  static void deleteBrew(Box<Brew> box, int index) {
    box.getAt(index).delete();
  }
}