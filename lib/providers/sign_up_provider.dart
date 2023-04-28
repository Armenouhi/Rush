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
  bool showDialog = false;
  bool isEmpty = false;
  late SharedPreferences sharedPreferences;
  var data;
  List<String> users = [];

  onLogin(BuildContext context) {
    if (usernameCtrl.text.isNotEmpty &&
        emailCtrl.text.isNotEmpty &&
        passwordCtrl.text.isNotEmpty &&
        comfirmPasswordCtrl.text.isNotEmpty) {
      showDialog = false;
      notifyListeners();
    } else {
      showDialog = true;
      isEmpty = true;

      notifyListeners();
    }
  }

  // Future<Map<String, String>> onSaveData(
  //     String username, String email, String password) async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   Map<String, String> data = {
  //     "username": username,
  //     "email": email,
  //     "password": password
  //   };

  //   String json = jsonEncode(data);

  //   if (json != sharedPreferences.getString('json')) {
  //     isCorrect = true;
  //     sharedPreferences.setString('json', json);
  //   } else {
  //     isCorrect = false;
  //     print('Account already exists!');
  //   }

  //   return data;
  // }

  // Future<void> getJsonData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   data = prefs.getString('json') ?? data;

  //   print(data);
  //   users.add(data);

  //   print(users);
  // }
}
