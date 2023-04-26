import 'dart:convert';

import 'package:exam_at/base/regexp.dart';
import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController comfirmPasswordCtrl = TextEditingController();
  bool isCorrect = false;
  late SharedPreferences sharedPreferences;
  var data;
  List<String> users = [];

  onLogin(BuildContext context) {
    final regExpUserName = RegExp(RegularExpressions.username);
    final regExpEmail = RegExp(RegularExpressions.email);
    final regExpPassword = RegExp(RegularExpressions.password);

    getJsonData();
    print(users);

    if (usernameCtrl.text.isNotEmpty &&
        emailCtrl.text.isNotEmpty &&
        passwordCtrl.text.isNotEmpty &&
        comfirmPasswordCtrl.text.isNotEmpty) {
      if (regExpUserName.hasMatch(usernameCtrl.text) &&
              usernameCtrl.text.length <=
                  20 /* &&
          usernameCtrl.text !=  data */
          ) {
        isCorrect = true;
        notifyListeners();
      } else {
        isCorrect = false;
        print('Account already exists!');
        notifyListeners();
      }

      if (regExpEmail.hasMatch(emailCtrl.text) // &&
          /* emailCtrl.text !=  map[0]['email'] */) {
        isCorrect = true;
        notifyListeners();
      } else {
        isCorrect = false;
        print('Account already exists!');
        notifyListeners();
      }

      if (regExpPassword.hasMatch(passwordCtrl.text) &&
          (passwordCtrl.text.length >= 8 && passwordCtrl.text.length <= 15)) {
        isCorrect = true;
        notifyListeners();
      } else {
        isCorrect = false;
        notifyListeners();
      }

      if (regExpPassword.hasMatch(comfirmPasswordCtrl.text)) {
        isCorrect = true;
        notifyListeners();
      } else {
        isCorrect = false;
        notifyListeners();
      }

      if (isCorrect == true && comfirmPasswordCtrl.text == passwordCtrl.text) {
        onSaveData(usernameCtrl.text, emailCtrl.text, passwordCtrl.text);
        Navigator.pushNamed(context, AppRoutes.login);
        notifyListeners();
      } else {
        print('Exception');
        notifyListeners();
      }

      notifyListeners();
    } else {
      print(
          'usernameCtrl\'s empty or emailCtrl\'s  empty or passwordCtrl\'s empty or comfirmPasswordCtrl\'s empty ');
      notifyListeners();
    }
  }

  Future<Map<String, String>> onSaveData(
      String username, String email, String password) async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> data = {
      "username": username,
      "email": email,
      "password": password
    };

    String json = jsonEncode(data);

    if (json != sharedPreferences.getString('json')) {
      isCorrect = true;
      sharedPreferences.setString('json', json);
    } else {
      isCorrect = false;
      print('Account already exists!');
    }

    return data;
  }

  Future<void> getJsonData() async {
    final prefs = await SharedPreferences.getInstance();
    data = prefs.getString('json') ?? data;

    print(data);
    users.add(data);

    print(users);
  }
}
