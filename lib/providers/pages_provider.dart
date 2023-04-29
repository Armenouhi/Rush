import 'package:flutter/material.dart';

class PagesProvider extends ChangeNotifier {
  bool isVisible = true;
  int index = 0;

  Future<bool> showIndicator() async {
    index += 1;
    notifyListeners();
    return isVisible;
  }
}
