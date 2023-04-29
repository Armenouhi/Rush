import 'dart:convert';

import 'package:exam_at/providers/sign_up_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/regexp.dart';

class LoginProvider extends ChangeNotifier {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  List<String> emails = [];
  List<String> passwords = [];

  bool isChecked = false;
  bool isChangePage = false;
  bool isShowDialog = false;
  bool isEmpty = true;
  bool obscureText = true;

  late SharedPreferences sharedPreferences;
  late Map val;

  LoginProvider() {
    getDataSP();
  }

  void checkCheckBox() {
    isChecked = true;
    notifyListeners();
  }

  Future<bool> onLogin() async {
    var value = await val;

    String? email;
    String? password;

    for (var entry in value.entries) {
      if (entry.key == 'email') {
        email = entry.value;
      }

      if (entry.key == 'password') {
        password = entry.value;
      }
    }

    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      if (usernameCtrl.text == email && passwordCtrl.text == password) {
        isChangePage = true;
        isShowDialog = false;
        notifyListeners();
        return isChangePage;
      } else {
        isShowDialog = true;
        isChangePage = false;
        isEmpty = false;
        notifyListeners();
        return isShowDialog;
      }
    } else {
      isShowDialog = true;
      isChangePage = false;
      isEmpty = true;
      notifyListeners();
      return isShowDialog;
    }

  }

  bool showHidePassword() {
    showPassword = !showPassword;
    obscureText = !obscureText;
    notifyListeners();
    return showPassword;
  }

  getDataSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(
      SignUpProvider.userInfo,
    );

    if (data == null) {
      isShowDialog = true;
      val = {};
      return;
    } else {
      var list = json.decode(data);

      for (var i = 0; i < list.length; i++) {
        val = Map.from(list[i]);
      }
    }
  }
}
