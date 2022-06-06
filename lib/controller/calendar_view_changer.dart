import 'package:flutter/material.dart';

class MessageData extends ChangeNotifier {
  String message = "Select message to share";

  setnewMessage(String value) {
    message = value;
    print(message);
    notifyListeners();
  }
}
