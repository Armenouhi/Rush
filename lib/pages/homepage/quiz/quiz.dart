import 'package:exam_at/base/routes.dart';
import 'package:exam_at/pages/homepage/quiz/questions.dart';
import 'package:exam_at/providers/questions_provider.dart';
import 'package:exam_at/providers/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quiz extends StatelessWidget {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return ChangeNotifierProvider(
      create: (context) => QuestionsProvider(),
      child: Scaffold(
        appBar: clicked == true ? AppBar() : null,
        body: Consumer<QuestionsProvider>(
          builder: (context, value, child) => value.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              // ignore: avoid_unnecessary_containers
              : Container(
                  decoration: BoxDecoration(
                    color: value.index - 1 > 0
                        ? value.colors[value.index - 1]
                        : value.isChangeText != true
                            ? value.colors[value.index]
                            : Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                        onPressed: value.index > 0
                            ? null
                            : () {
                                value.changeText();
                                clicked = true;
                                // value.changeSeconds(
                                //   value.questionsData[0].answers![0].answerId
                                // );
                                // value.changeAppbarBGColor();
                              },
                        child: value.isChangeText != true
                            ? Text(
                                value.text,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            : QuestionsWidget()),
                  ),
                ),
        ),
      ),
    );
  }
}