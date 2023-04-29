import 'package:exam_at/api/project_api.dart';
import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../styles/style_of_container.dart';

class QuestionsProvider extends ChangeNotifier {
  QuestionsProvider() {
    changeColors();
    changeIndex();
    getData();
  }

  QuizModel? quizData;
  List<Questions> questionsData = [];
  bool isLoading = true;

  List<Color> colors = [];
  int index = 5;
  Color color = Colors.white;
  List<int> answers = [-1, -1, -1];
  int currentQuestionIndex = 0;
  bool isChangeText = false;
  bool showResult = false;
  bool correctAnswer = false;
  bool checkAnswer = false;
  PageController pageController = PageController();
  int questionIndex = 0;
  double scale = 1.0;
  String text = 'Get Ready';
  int seconds = 60;
  int swiftness = 0;
  int i = 0, j = 0;
  int score = 0;
  int count = 0;
  bool flag = true;

  Color backColor = const Color.fromRGBO(249, 249, 249, 0.8);

  ContainerColors colorsContainer = ContainerColors();

  void changeColors() {
    colors = colorsContainer.colors;
  }

  void changeAppbarBGColor() async {
    colors = colorsContainer.colors;
    Duration interval = const Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(interval, (it) => (it - 4));

    await for (int i in stream) {
      index = i;
      color = colors[i];
      notifyListeners();
    }
  }

  void changeIndex() async {
    Duration interval = const Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(interval, (it) => -1 * (it - 4));

    await for (int i in stream) {
      index = i;
      text = '$index';
      if (i == 0) {
        text = 'GO';
        break;
      }
      notifyListeners();
    }

    notifyListeners();
  }

  void changeText() {
    isChangeText = true;
    notifyListeners();
  }

  void correctAnswerColor() {
    correctAnswer = true;
    notifyListeners();
  }

  Future<List<Questions>> getData() async {
    isLoading = true;
    final result = await ProjectAPI().quizApi.getQuizData();

    isLoading = false;
    quizData = result;
    questionsData = result.questions!;
    notifyListeners();
    return questionsData;
  }

  int onChangeIndex(index) {
    currentQuestionIndex = index;
    notifyListeners();
    return currentQuestionIndex;
  }

  bool onAnswerPressed() {
    showResult = true;
    notifyListeners();
    return showResult;
  }

  answerPressed(answerId) {
    if (currentQuestionIndex == questionsData.length - 1) {
      return onAnswerPressed();
    } else {
      pageController.animateToPage(currentQuestionIndex + 1,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 700));

      notifyListeners();
    }
  }

  Future<bool> onCheckAnswer(answerId) async {
    checkAnswer = true;

    int lengthAnswers = questionsData[currentQuestionIndex].answers!.length;

    for (i; i < lengthAnswers; i++) {
      if (questionsData[currentQuestionIndex].answers![i].answerId ==
          answerId) {
        questionIndex = currentQuestionIndex;
        if (questionsData[currentQuestionIndex].answers![i].correctAnswer ==
            true) {
          correctAnswer = true;
          answers[i] = 1;
          count += 1;

          notifyListeners();
          return correctAnswer;
        } else {
          correctAnswer = false;

          answers[i] = 0;

          notifyListeners();
          return correctAnswer;
        }
      }
    }

    notifyListeners();
    return correctAnswer;
  }

  Future<int> showScore() async {
    var futureThatStopsIt = Future.delayed(const Duration(seconds: 1), () {
      flag = false;
      notifyListeners();
    });

    var futureWithTheLoop = () async {
      while (flag) {
        count++;
        score = seconds - count;
        await Future.delayed(Duration(seconds: 0));

        notifyListeners();
      }
    }();

    await Future.wait([futureThatStopsIt, futureWithTheLoop]);

    notifyListeners();
    return score;
  }
}
