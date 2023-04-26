// import 'package:exam_at/pages/auth/login/login.dart';

import 'package:exam_at/pages/auth/login.dart';
import 'package:exam_at/pages/homepage/homepage.dart';
import 'package:exam_at/styles/style_of_appbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'base/routes.dart';
import 'pages/homepage/quiz/questions.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppBarStyle appBarStyle = AppBarStyle();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appBarStyle.white,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(204, 0, 1, 0.8),
        ),
      ),
      // home: LoginPage(),
      home: QuestionsWidget(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
