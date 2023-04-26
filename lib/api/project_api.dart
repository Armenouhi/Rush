// ignore_for_file: prefer_conditional_assignment

import 'package:dio/dio.dart';
import 'package:exam_at/api/leaderboard/leaderboard_api.dart';
import 'package:exam_at/api/purchases/purchases_api.dart';
import 'package:exam_at/api/quiz/quiz_api.dart';

class ProjectAPI {
  static ProjectAPI? _singleton;

  late QuizApi quizApi;
  late PurchasesApi purchasesApi;
  late LeaderbordApi leaderbordApi;

  Dio appDioClient = Dio();

  factory ProjectAPI() {
    if (_singleton == null) {
      _singleton = ProjectAPI._internal();
    }
    return _singleton!;
  }

  ProjectAPI._internal() {
    // Init subclasses
    quizApi = QuizApi(appDioClient);
    purchasesApi = PurchasesApi(appDioClient);
    leaderbordApi = LeaderbordApi(appDioClient);
  }
}
