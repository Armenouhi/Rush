import 'package:exam_at/core/style.dart';
import 'package:exam_at/pages/homepage/quiz/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/routes.dart';
import '../../../models/quiz.dart';

// ignore: must_be_immutable
class BuildQuestions extends StatelessWidget {
  Questions question;
  int length = 0;

  BuildQuestions(
    this.question, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return _buildQuestion(context, question);
  }

  Widget _buildQuestion(BuildContext context, Questions questionData) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${questionData.questionText}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          questionData.questionImageUrl != null
              ? Image.network('${questionData.questionImageUrl}')
              : Container(),
          // const SizedBox(height: 20),
          Column(
            children: questionData.answers!
                .map<Widget>(
                  (a) => _answerOption(a),
                )
                .toList(),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _answerOption(
    Answers answerData,
  ) {
    return Consumer<QuestionsProvider>(
      builder: ((context, provider, child) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 20.0,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              // provider.onAnswered();
              length++;
              provider.showScore();
              print(provider.swiftness);
              provider.changeColor();
              provider.answerPressed(answerData.answerId);
              provider.correctAnswerMethod(answerData.answerId);

              if (provider.length == 3) {
                Navigator.pushReplacementNamed(context, AppRoutes.score);
                // print(provider.second);
              }
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 10, left: 10),
                  child: Center(child: Text('${answerData.answerText}')),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
