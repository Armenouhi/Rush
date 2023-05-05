import 'package:exam_at/pages/auth/pasword/change_password.dart';
import 'package:exam_at/pages/auth/pasword/new_password.dart';
import 'package:exam_at/pages/homepage/homepage.dart';
import 'package:exam_at/providers/leaderboard_provider.dart';
import 'package:exam_at/pages/homepage/screen/pages/pages.dart';
import 'package:exam_at/providers/questions_provider.dart';

import 'package:exam_at/pages/homepage/quiz/quiz.dart';
import 'package:exam_at/pages/homepage/quiz/score.dart';
import 'package:exam_at/pages/auth/sign_up/sign_up.dart';
import 'package:exam_at/utils/verification/verification.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/auth/login/login.dart';
import '../pages/homepage/leaderboard/leaderboard.dart';
import '../pages/homepage/purchases/purchases.dart';
import '../providers/purchases_provider.dart';
import '../pages/homepage/quiz/questions.dart';

class AppRoutes {
  static const login = '/';
  static const signUp = '/signup';
  static const homepage = '/homepage';
  static const leaderBoard = '/leaderboard';
  static const pages = '/pages';
  static const quiz = '/quiz';
  static const questions = '/questions';
  static const purchases = '/purchases';
  static const score = '/score';
  static const changePassword = '/forget&password';
  static const newPassword = '/new&password';
  static const pinCodeVerificationScreen = '/pin&code&verification&screen';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => LoginPage(),
      AppRoutes.signUp: (context) => SignUp(),
      AppRoutes.pages: (context) => Pages(),
      AppRoutes.homepage: (context) => HomePage(),
      AppRoutes.leaderBoard: (context) => ChangeNotifierProvider(
            create: (context) => LeaderBoarderProvider(),
            child: LeaderBord(),
          ),
      AppRoutes.quiz: (context) => Quiz(),
      AppRoutes.purchases: (context) => ChangeNotifierProvider(
            create: (context) => PurchasesProvider(),
            child: Purchases(),
          ),
      AppRoutes.questions: (context) => ChangeNotifierProvider(
            create: (context) => QuestionsProvider(),
            child: QuestionsWidget(),
          ),
      AppRoutes.score: (context) => const Score(),
      AppRoutes.changePassword: (context) => ChangePassord(),
      AppRoutes.newPassword: (context) => NewPassword(),
      AppRoutes.pinCodeVerificationScreen:(context) =>  const PinCodeVerificationScreen(phoneNumber: '+37494182844'),
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}
