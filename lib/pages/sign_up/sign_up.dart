import 'package:exam_at/base/routes.dart';
import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/images.dart';
import 'package:exam_at/core/strings.dart';
import 'package:exam_at/core/style.dart';
import 'package:exam_at/pages/sign_up/sign_up_provider.dart';
import 'package:exam_at/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: Scaffold(body: _buildContent()),
    );
  }

  Widget _buildContent() {
    return Consumer<SignUpProvider>(
      builder: (context, value, child) => Column(
        children: [
          SizedBox(
            height: TrivialRushStyle.double50,
          ),
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
          SizedBox(
            height: TrivialRushStyle.double50,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: TrivialRushStyle.double20,
                right: TrivialRushStyle.double20),
            child: TextField(
              controller: value.usernameCtrl,
              decoration: InputDecoration(
                labelText: Strings.username, //at@gmail.com
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: TrivialRushStyle.double20,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: TrivialRushStyle.double20,
                right: TrivialRushStyle.double20),
            child: TextField(
              controller: value.emailCtrl,
              decoration: InputDecoration(
                labelText: Strings.email,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: TrivialRushStyle.double20,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: TrivialRushStyle.double20,
                right: TrivialRushStyle.double20),
            child: TextField(
              controller: value.passwordCtrl,
              decoration: InputDecoration(
                labelText: Strings.password,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: TrivialRushStyle.double20,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: TrivialRushStyle.double20,
                right: TrivialRushStyle.double20),
            child: TextField(
              controller: value.comfirmPasswordCtrl,
              decoration: InputDecoration(
                labelText: Strings.comfirmPassword,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: TrivialRushStyle.double50,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: TrivialRushStyle.double20,
                right: TrivialRushStyle.double20),
            child: RadButton(
                callback: () {
                  value.onLogin(context);
                },
                context: context,
                page: AppRoutes.login,
                textBtn: Strings.save,
                btnColor: TrivialRushColors.red),
          ),
          // const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       height: TrivialRushStyle.double300,
          //       child: Expanded(
          //         child: Image.asset(
          //           TrivialRushImages.group4539,
          //           height: TrivialRushStyle.double100,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
