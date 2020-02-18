import 'package:alebrew/src/models/brew.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Functions { 
  static void addBrewToDatabase(String brewName, [bool firstTime = false]) async {
    Box<dynamic> _brewery = await Hive.openBox<Brew>("Brewery");
    // _brewery.clear();

    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);

    _brewery.add(Brew(brewName, _lastEdited));

    print(_brewery.values);
  }
}