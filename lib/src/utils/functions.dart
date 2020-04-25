import 'package:alebrew/src/models/batch.dart';
import 'package:alebrew/src/models/brew.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Functions {
  Brew currentBrew;

  static Future addBrewOrBatchToDatabase(String brewName,
      {Brew brewThatHasNewBatch}) async {
    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);

    Box<dynamic> _brewery = await Hive.openBox<Brew>("Brewery");
    String _brewName = brewName.trim();

    if (brewThatHasNewBatch != null) {
      brewThatHasNewBatch.pageList.add(
        Batch(name: brewName, bottleCount: [], recipe: []),
      );
      brewThatHasNewBatch.save();
      return (brewThatHasNewBatch.pageList.last);
    }

    _brewery.add(Brew(name: _brewName, lastEdited: _lastEdited, pageList: []));
    return (_brewery.values.where((brew) => brew.name == _brewName).last);
  }

  static void updateBrewName(Box<Brew> box, int index, String newName) {
    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);

    box.getAt(index).name = newName.trim();
    box.getAt(index).lastEdited = _lastEdited;

    box.getAt(index).save();
  }

  static void restoreBrew(Box<Brew> box, int index) async {
    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);
    Box<dynamic> _brewery = await Hive.openBox<Brew>("Brewery");

    var _tempBrew = box.getAt(index);
    box.getAt(index).delete();

    _tempBrew.lastEdited = _lastEdited;
    _brewery.add(_tempBrew);
  }

  static void deleteBrew(Box<Brew> box, int index) async {
    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);
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
