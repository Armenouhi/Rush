import 'package:exam_at/base/routes.dart';
import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/strings.dart';
import 'package:exam_at/core/style.dart';
import 'package:flutter/material.dart';

class ChangePassord extends StatelessWidget {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.forgetPassword),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: TrivialRushStyle.double20,
                right: TrivialRushStyle.double20),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.album),
                    title: Text(
                      Strings.searchAccount,
                      style: TextStyle(
                          fontSize: TrivialRushStyle.double20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(Strings.enterEmailOrNumber),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: TrivialRushStyle.double10,
                        left: TrivialRushStyle.double5,
                        right: TrivialRushStyle.double5),
                    child: TextField(
                      controller: emailCtrl,
                      decoration: InputDecoration(
                        labelText: Strings.emailOrPhoneNumber,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            Strings.cancel,
                            style:
                                const TextStyle(color: TrivialRushColors.black),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: Text(
                            Strings.search,
                            style:
                                const TextStyle(color: TrivialRushColors.black),
                          ), 
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.pinCodeVerificationScreen);
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
