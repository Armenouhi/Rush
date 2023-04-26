

import 'package:dio/dio.dart';

import '../../models/quiz.dart';

class QuizApi {
  final Dio appDioClient;

  QuizApi(
    this.appDioClient,
  );

  Future<QuizModel> getQuizData() async {
    QuizModel quizData;

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/quiz',
    );

    var res = result.data as Map<String, dynamic>;
    quizData = QuizModel.fromJson(res);

    return quizData;
  }

  
}
