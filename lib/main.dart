import 'package:exam_at/pages/auth/login/login.dart';
import 'package:exam_at/pages/homepage/quiz/questions.dart';
import 'package:exam_at/styles/style_of_appbar.dart';

import 'package:flutter/material.dart';

import 'base/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppBarStyle appBarStyle = AppBarStyle();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appBarStyle.white,
        inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            labelStyle: TextStyle(
              color: Colors.grey,
            )),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(204, 0, 1, 0.8),
        ),
      ),
      home: LoginPage(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
