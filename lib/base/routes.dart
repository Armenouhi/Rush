import 'package:exam_at/pages/homepage/homepage.dart';
import 'package:exam_at/providers/leaderboard_provider.dart';
import 'package:exam_at/pages/homepage/screen/pages/pages.dart';
import 'package:exam_at/providers/questions_provider.dart';

import 'package:exam_at/pages/homepage/quiz/quiz.dart';
import 'package:exam_at/pages/homepage/quiz/score.dart';
import 'package:exam_at/pages/sign_up/sign_up.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/auth/login/login.dart';
import '../pages/homepage/leaderboard/leaderboard.dart';
import '../pages/homepage/purchases/purchases.dart';
import '../providers/purchases_provider.dart';
import '../pages/homepage/quiz/questions.dart';

class AppRoutes {
  static const login = '/';
  static const signUp = '/sign up';
  static const homepage = '/homepage';
  static const leaderBoard = '/leaderboard';
  static const pages = '/pages';
  static const quiz = '/quiz';
  static const questions = '/questions';
  static const purchases = '/purchases';
  static const score = '/score';

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
      // AppRoutes.purchases: (context) => Purchases(),
      AppRoutes.purchases: (context) => ChangeNotifierProvider(
            create: (context) => PurchasesProvider(),
            child: Purchases(),
          ),
      AppRoutes.questions: (context) => ChangeNotifierProvider(
            create: (context) => QuestionsProvider(),
            child: QuestionsWidget(),
          ),
      AppRoutes.score: (context) => const Score()
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
