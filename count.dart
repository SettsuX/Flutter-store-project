import 'package:flutter/foundation.dart';

class Count with ChangeNotifier {
  int _value2 = 0;
  int _value3 = 0;
  String _name = "Bread";
  int _prize = 20;
  int get value1 => _value3;
  int get values => _value2;
  String get name => _name;
  int get prize => _prize;
  void plas() {
    _value2++;
    notifyListeners();
  }

  void del() {
    _value2--;
    if (_value2 < 0) {
      _value2 = 0;
    }
    notifyListeners();
  }

  void change() {
    _name = "Bread";
    _prize = 20;
  }

  void change1() {
    _name = "Donut";
    _prize = 10;
  }
}
