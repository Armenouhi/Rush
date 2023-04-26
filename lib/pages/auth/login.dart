import 'package:exam_at/base/routes.dart';
import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/images.dart';
import 'package:exam_at/core/strings.dart';
import 'package:exam_at/core/style.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/buttons/button.dart';
import '../../../widgets/buttons/text_button.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isChecked = false;
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    TrivialRushImages.logo,
                    height: TrivialRushStyle.double100,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: TrivialRushStyle.double5,
                  right: TrivialRushStyle.double5),
              child: TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: Strings.email, //at@gmail.com
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: TrivialRushStyle.double5,
                  right: TrivialRushStyle.double5),
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: Strings.password,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: true
                        ? const Icon(
                            Icons.visibility,
                          )
                        // ignore: dead_code
                        : const Icon(
                            Icons.visibility_off,
                          ),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: isChecked != true
                      ? TrivialRushColors.white
                      : TrivialRushColors.orange,
                  value: isChecked,
                  onChanged: (bool? checked) {
                    checkCheckBox();
                    isChecked = checked!;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: TrivialRushStyle.double10),
                  child: Text(Strings.rememberPassword),
                )
              ],
            ),
            RadButton(
                callback: () {
                  onLogin();
                },
                context: context,
                page: AppRoutes.pages,
                textBtn: Strings.login,
                btnColor: TrivialRushColors.red),
            TextBtn(
              textBtn: Strings.forgetPassword,
              onPressed: () => print('Մի բան'),
            ),
            TextBtn(
                textBtn: Strings.signUp,
                onPressed: () => Navigator.pushNamed(context, AppRoutes.signUp))
          ],
        ),
      ),
    );
  }

  void checkCheckBox() {
    setState(() {
      isChecked = true;
    });
  }

  onLogin() {
    Map<String, String> users = {
      'email': emailCtrl.text,
      'password': passwordCtrl.text
    };

    dbRef.push().set(users);
  }
}
