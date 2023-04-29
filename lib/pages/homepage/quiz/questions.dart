import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/style.dart';
import 'package:exam_at/pages/homepage/quiz/build_question.dart';
import 'package:exam_at/providers/questions_provider.dart';
import 'package:exam_at/providers/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles/style_of_container.dart';
import '../../../widgets/diagonally_shaped_card.dart';

class QuestionsWidget extends StatelessWidget {
  QuestionsWidget({super.key});
  int index = -1;
  int i = 0;
  bool checkAnswer = false;

  ContainerColors colorsContainer = ContainerColors();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuestionsProvider(),
      child: Consumer<QuestionsProvider>(
        builder: (context, value, child) =>
            Stack(alignment: Alignment.topCenter, children: <Widget>[
          Scaffold(
              appBar: AppBar(
                backgroundColor: TrivialRushColors.colors[value.i],
              ),
              body: value.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Question(value)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Consumer<QuestionsProvider>(
              builder: (context, value, child) => TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(seconds: value.seconds),
                builder: (context, second, child) {
                  return value.isLoading == true
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            Stack(
                              children: [
                                value.isLoading == true
                                    ? const CircularProgressIndicator()
                                    : Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: CircularProgressIndicator(
                                            value: second,
                                            color: TrivialRushColors.white,
                                            backgroundColor: TrivialRushColors
                                                .colors[value.i],
                                            strokeWidth: 8,
                                          ),
                                        ),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TweenAnimationBuilder(
                                      tween: Tween(
                                          begin: value.seconds.toDouble(),
                                          end: 0.0),
                                      duration:
                                          Duration(seconds: value.seconds),
                                      builder: (context, valueT, _) {
                                        var timer = valueT;

                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              timer.toStringAsFixed(0),
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontFamily:
                                                      'AmericanTypeWriter',
                                                  color:
                                                      TrivialRushColors.white),
                                            ),
                                            Text(
                                              timer.toString().length < 5
                                                  ? '.00'
                                                  : '.${timer.toString().substring(3, 5)}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'AmericanTypeWriter',
                                                  color:
                                                      TrivialRushColors.white),
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
      ),
    );
  }

  Widget Question(QuestionsProvider questionProvider) {
    return Column(
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
                  i = index;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Consumer<QuestionsProvider>(
                      builder: (context, value, child) => DiagonallyShapedCard(
                          index: index + 1,
                          width: 80,
                          height: 40,
                          color: value.answers[i] == -1
                              ? const Color.fromRGBO(249, 249, 249, 0.8)
                              : value.answers[i] == 1
                                  ? const Color.fromRGBO(0, 153, 0, 0.8)
                                  : const Color.fromRGBO(204, 0, 1, 0.8)),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
        Expanded(
          child: PageView.builder(
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
    );
  }
}
