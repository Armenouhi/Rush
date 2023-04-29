import 'dart:convert';

import 'package:exam_at/base/regexp.dart';
import 'package:exam_at/base/routes.dart';
import 'package:exam_at/models/user_info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController comfirmPasswordCtrl = TextEditingController();
  bool showDialog = false;
  bool isEmpty = false;
  bool isCorrectData = false;
  static const userInfo = 'userInfo';
  List<UserInfoModel> users = [];

  SignUpProvider() {
    _initData();
  }

  onLogin(BuildContext context) async {
    if (usernameCtrl.text.isNotEmpty &&
        emailCtrl.text.isNotEmpty &&
        passwordCtrl.text.isNotEmpty &&
        comfirmPasswordCtrl.text.isNotEmpty) {
      showDialog = false;

      await _setInformation(
          usernameCtrl.text, emailCtrl.text, passwordCtrl.text);
      notifyListeners();
    } else {
      showDialog = true;
      isEmpty = true;

      notifyListeners();
    }
  }

  Future _setInformation(
    String username,
    String email,
    String password,
  ) async {
    var value = UserInfoModel(
        id: '${username.hashCode}',
        username: username,
        email: email,
        password: password);

    users.add(value);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = UserInfoModel.encode(users);

    await prefs.setString(userInfo, encodedData);

    final String json = await prefs.getString(userInfo) ?? '';

    final List<UserInfoModel> data = UserInfoModel.decode(json);
  }

  Future<String> _getInformation() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(userInfo) ?? '';
  }

  Future _initData() async {
    var data = await _getInformation();
    
  }
}
