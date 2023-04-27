import 'package:exam_at/api/project_api.dart';
import 'package:flutter/material.dart';

import '../../../models/quiz.dart';
import '../../../styles/style_of_container.dart';

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
  // int length = 0;
  int i = 0;
  int score = 0;
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

  getData() async {
    isLoading = true;
    final result = await ProjectAPI().quizApi.getQuizData();

    isLoading = false;
    quizData = result;
    questionsData = result.questions!;
    notifyListeners();
  }

  onChangeIndex(index) {
    currentQuestionIndex = index;
    notifyListeners();
  }

  onAnswerPressed() {
    showResult = true;
    notifyListeners();
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

  onCheckAnswer(answerId) async {
    checkAnswer = true;
    i++;
    int lengthAnswers = questionsData[currentQuestionIndex].answers!.length;

    for (var i = 0; i < lengthAnswers; i++) {
      if (questionsData[currentQuestionIndex].answers![i].answerId ==
          answerId) {
        showScore();
        questionIndex = currentQuestionIndex;
        if (questionsData[currentQuestionIndex].answers![i].correctAnswer ==
            true) {
          correctAnswer = true;
          backColor = const Color.fromRGBO(0, 153, 0, 0.8);
          notifyListeners();
          return;
        } else {
          correctAnswer = false;
          backColor = const Color.fromRGBO(204, 0, 1, 0.8);
          notifyListeners();
          return;
        }
      }
    }
    notifyListeners();
    return correctAnswer;
  }

  showScore() {
    if (currentQuestionIndex == questionsData.length - 1) {
      score++;
      print(score);

      notifyListeners();
    } else {
      score += 0;
      notifyListeners();
    }

    swiftness += 20;
    print(swiftness);

    notifyListeners();
  }
}
