import 'package:flutter/foundation.dart';

class BrewProvider with ChangeNotifier {
  String _mitexto = "Text inicial";

  String get mitexto  => _mitexto;

  set mitexto(String newTexto) {
    _mitexto = newTexto;
    notifyListeners();
  }  
}