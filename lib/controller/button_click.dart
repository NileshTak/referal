import 'package:flutter/material.dart';

class ButtonClick extends ChangeNotifier {
  int number = 0;
  void increment() {
    number++;
    notifyListeners();
  }

  void decrement() {
    number--;
    notifyListeners();
  }
}
