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
  int length = 0;
  int i = 0;
  int score = 0;

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

  correctAnswerMethod(answerId) async {
    checkAnswer = true;
    int lengthAnswers = questionsData[currentQuestionIndex].answers!.length;

    for (var i = 0; i < lengthAnswers; i++) {
      if (questionsData[currentQuestionIndex].answers![i].answerId ==
          answerId) {
        questionIndex = currentQuestionIndex;
        if (questionsData[currentQuestionIndex].answers![i].correctAnswer ==
            true) {
          correctAnswer = true;
          notifyListeners();
          return;
        } else {
          correctAnswer = false;
          notifyListeners();
          return;
        }
      }
    }
    notifyListeners();
    return correctAnswer;
  }

  changeColor() {
    i += 1;
  }

  // changeSeconds(answerId) async {
  //   length += 1;
  //   Duration interval = const Duration(seconds: 1);
  //   Stream<int> stream = Stream<int>.periodic(interval, (it) => -1 * (it - 60));
  //   await for (int i in stream) {
  //     seconds = i;
  //     if (i == 0) {
  //       seconds *= -1;
  //       notifyListeners();
  //       break;
  //     }

  //     if (i == 50) {
  //       swiftness += i;
  //       notifyListeners();
  //       break;
  //     }
  //     notifyListeners();
  //   }
  //   notifyListeners();
  // }

  showScore() {
    if (currentQuestionIndex == questionsData.length - 1) {
      score++;
      notifyListeners();
    } else {
      score += 0;
      notifyListeners();
    }
    
    notifyListeners();
  }
}
