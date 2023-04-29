import 'package:exam_at/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/routes.dart';
import '../../../models/quiz.dart';

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
              length++;

              provider.answerPressed(answerData.answerId);
              provider.onCheckAnswer(answerData.answerId);

              if (provider.currentQuestionIndex == 2) {
                const Duration(
                  seconds: 2000,
                );
                Navigator.pushReplacementNamed(context, AppRoutes.score);
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
