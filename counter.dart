import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _value = 0;
  String _name = "Coffee";
  int _prize = 40;
  int get value => _value;
  String get name => _name;
  int get prize => _prize;
  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    if (_value < 0) {
      _value = 0;
    }
    notifyListeners();
  }

  void tt() {
    _value * _prize;
  }

  void change() {
    _name = "Coffee";
    _prize = 40;
  }

  void change1() {
    _name = "Tea";
    _prize = 30;
  }
}
