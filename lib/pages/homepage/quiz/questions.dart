import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/style.dart';
import 'package:exam_at/pages/homepage/quiz/build_question.dart';
import 'package:exam_at/pages/homepage/quiz/questions_provider.dart';
import 'package:exam_at/pages/homepage/quiz/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles/style_of_container.dart';
import '../../../widgets/diagonally_shaped_card.dart';

class QuestionsWidget extends StatelessWidget {
  QuestionsWidget({super.key});
  int index = 0;
  bool checkAnswer = false;

  ContainerColors colorsContainer = ContainerColors();

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => QuestionsProvider(),
      child: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Consumer<QuestionsProvider>(
          builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: TrivialRushColors.colors[value.i],
              ),
              body: value.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Question(value)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Consumer<QuestionsProvider>(
            builder: (context, value, child) => TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: value.seconds),
              builder: (context, second, child) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator(
                              value: second,
                              color: TrivialRushColors.white,
                              backgroundColor: TrivialRushColors.colors[value.i],
                              strokeWidth: 8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: TweenAnimationBuilder(
                              tween: Tween(begin: value.seconds.toDouble(), end: 0.0),
                              duration: Duration(seconds: value.seconds),
                              builder: (context, valueT, _) {
                                var timer = valueT;

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      timer.toStringAsFixed(0),
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'AmericanTypeWriter',
                                          color: TrivialRushColors.white),
                                    ),
                                    Text(
                                      timer.toString().length < 5
                                          ? '.00'
                                          : '.${timer.toString().substring(3, 5)}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'AmericanTypeWriter',
                                          color: TrivialRushColors
                                              .white // colorsContainer.colors[3],
                                          ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget Question(questionProvider) {
    return Scrollbar(
      child: Column(
        children: <Widget>[
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 35),
              child: SizedBox(
                width: 200,
                height: 70,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: questionProvider.questionsData.length,
                  ),
                  itemCount: questionProvider.questionsData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Consumer<QuestionsProvider>(
                        builder: (context, value, child) =>
                            DiagonallyShapedCard(
                          index: index ,
                          width: 80,
                          height: 40,
                          color: questionProvider.checkAnswer != true
                              ? const Color.fromRGBO(249, 249, 249, 0.8)
                              : index == value.currentQuestionIndex //
                                  ? value.correctAnswer == true
                                      ? const Color.fromRGBO(0, 153, 0, 0.8)
                                      : const Color.fromRGBO(204, 0, 1, 0.8)
                                  : const Color.fromRGBO(249, 249, 249, 0.8),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: ((value) => questionProvider.onChangeIndex(value)),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuildQuestions(questionProvider.questionsData[index]),
                  ],
                );
              },
              itemCount: questionProvider.questionsData.length,
              scrollDirection: Axis.horizontal,
              controller: questionProvider.pageController,
            ),
          ),
        ],
      ),
    );
  }
}
