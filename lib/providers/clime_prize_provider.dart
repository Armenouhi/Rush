import 'package:flutter/cupertino.dart';

class ClimePrizeProvider extends ChangeNotifier {
  bool isChangePage = false;

  onChangePage() {
    isChangePage = true;
    notifyListeners();
  }
}
