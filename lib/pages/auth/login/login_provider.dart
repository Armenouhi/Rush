import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../base/regexp.dart';

class LoginProvider extends ChangeNotifier {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isChecked = false;
  bool isChangePage = false;
  bool showDialog = false;
  bool isEmpty = false;

  late SharedPreferences sharedPreferences;
  var data;

  LoginProvider() {
    getJsonData();
    // onLogin();
  }

  void checkCheckBox() {
    isChecked = true;
    notifyListeners();
  }

  onLogin() {
    final regExp = RegExp(RegularExpressions.email);

    // email: armenuhi.h.toroyan@gmail.com, password: Armenuhi1993!

    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      if (regExp.hasMatch(usernameCtrl.text)) {
        isChangePage = true;
      } else {
        showDialog = true;
      }

      notifyListeners();
    } else {
      isChangePage = false;
      showDialog = true;
      isEmpty = true;
    }

    return isChangePage;
  }

  Future<void> getJsonData() async {
    final prefs = await SharedPreferences.getInstance();
    data = prefs.getString('json') ?? data;

    print(data.runtimeType);
    Map json = jsonDecode(data);
    var js = json as Map;

    // print(js.map((key, value) => value));
  }
}
