import 'package:exam_at/base/routes.dart';
import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/images.dart';
import 'package:exam_at/core/strings.dart';
import 'package:exam_at/core/style.dart';
import 'package:exam_at/providers/sign_up_provider.dart';
import 'package:exam_at/utils/validation/validation.dart';
import 'package:exam_at/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
          ReactiveFormBuilder(
            form: () => form,
            builder: (context, formGroup, child) => Padding(
              padding: EdgeInsets.only(
                  left: TrivialRushStyle.double20,
                  right: TrivialRushStyle.double20),
              child: Column(
                children: [
                  ReactiveTextField(
                    controller: value.usernameCtrl,
                    decoration: InputDecoration(
                      labelText: Strings.username, 
                      border: const OutlineInputBorder(),
                    ),
                    formControlName: 'username',
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Field must not be empty',
                    },
                  ),
                  SizedBox(
                    height: TrivialRushStyle.double20,
                  ),
                  ReactiveTextField(
                    controller: value.emailCtrl,
                    decoration: InputDecoration(
                      labelText: Strings.email,
                      border: const OutlineInputBorder(),
                    ),
                    formControlName: 'email',
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Field must not be empty',
                      ValidationMessage.email: (error) =>
                          'Must enter a valid email',
                    },
                  ),
                  SizedBox(
                    height: TrivialRushStyle.double20,
                  ),
                  ReactiveTextField(
                    controller: value.passwordCtrl,
                    decoration: InputDecoration(
                      labelText: Strings.password,
                      border: const OutlineInputBorder(),
                    ),
                    formControlName: 'password',
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Field must not be empty',
                      ValidationMessage.pattern: (error) =>
                          'The password must have \n one capital letter, one lowercase letter, one number \n [minimum length 8]'
                    },
                  ),
                  SizedBox(
                    height: TrivialRushStyle.double20,
                  ),
                  ReactiveTextField(
                    controller: value.comfirmPasswordCtrl,
                    decoration: InputDecoration(
                      labelText: Strings.comfirmPassword,
                      border: const OutlineInputBorder(),
                    ),
                    formControlName: 'comfirmPassword',
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Field must not be empty',
                      ValidationMessage.mustMatch: (error) =>
                          'Cannot pack! The passwords are different!',
                    },
                  ),
                ],
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
                  if (value.showDialog == true) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return _dialog(
                            context,
                            title: Strings.error,
                            content: value.isEmpty == false
                                ? ''
                                : Strings.credentialsEmpty,
                          );
                        });
                  } else {
                    Navigator.pushNamed(context, AppRoutes.login);
                  }
                },
                context: context,
                page: AppRoutes.login,
                textBtn: Strings.save,
                btnColor: TrivialRushColors.red),
          ),
        ],
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
