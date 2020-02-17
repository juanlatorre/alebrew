import 'package:alebrew/src/models/brew.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Functions { 
  static void addBrewToDatabase(String brewName) async {
    Box<dynamic> _dataBox = await Hive.openBox("data");

    int _id = _dataBox.get('brewList') == [] ? 1 : _dataBox.get('brewList').length;
    DateTime _now = DateTime.now().toLocal();
    String _lastEdited = DateFormat('MMM. d, y HH:mm').format(_now);

    Brew _newBrew = Brew(_id, brewName, _lastEdited, []);

    List<Brew> _brewList = _dataBox.get('brewList');

    _brewList.add(_newBrew);

    _dataBox.put("brewList", _brewList);

    print(_dataBox.get('brewList'));

    // FIXME
  }
}