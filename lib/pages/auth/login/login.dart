import 'package:exam_at/base/routes.dart';
import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/images.dart';
import 'package:exam_at/core/strings.dart';
import 'package:exam_at/core/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/buttons/button.dart';
import '../../../widgets/buttons/text_button.dart';
import 'login_provider.dart';

class LoginPage extends StatelessWidget {
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<LoginProvider>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
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
                    controller: value.usernameCtrl,
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
                    controller: value.passwordCtrl,
                    obscureText: value.obscureText,
                    decoration: InputDecoration(
                      labelText: Strings.password,
                      suffixIcon: IconButton(
                        onPressed: () {
                          value.showHidePassword();
                        },
                        icon: value.showPassword == false
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              )
                            // ignore: dead_code
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: value.isChecked != true
                          ? TrivialRushColors.white
                          : TrivialRushColors.orange,
                      value: value.isChecked,
                      onChanged: (bool? checked) {
                        value.checkCheckBox();
                        value.isChecked = checked!;
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
                      value.onLogin();
                      if (value.isChangePage == true) {
                        Navigator.pushNamed(context, AppRoutes.pages);
                      } else {
                        value.showDialog == true
                            ? showDialog(
                                context: context,
                                builder: (context) {
                                  return _dialog(
                                    context,
                                    title: Strings.error,
                                    content: value.isEmpty == false
                                        ? Strings.usernameException
                                        : Strings.credentialsEmpty,
                                  );
                                })
                            : Container();
                      }
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
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signUp))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialog(
    context, {
    required String title,
    String? content,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(content ?? Strings.credentialsEmpty),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            Strings.ok,
            style: const TextStyle(
              color: TrivialRushColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
