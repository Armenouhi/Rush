import 'package:exam_at/base/routes.dart';
import 'package:exam_at/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/buttons/button.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    return score(context);
  }

  Widget score(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => QuestionsProvider(),
      child: Consumer<QuestionsProvider>(
        builder: (context, value, child) => Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 153, 0, 0.8),
                border: Border.all(
                  color: Colors.grey,
                  width: 5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 250, bottom: 250),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Score',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      '${value.swiftness}',
                      style: const TextStyle(fontSize: 70, color: Colors.white),
                    ),
                    const Spacer(),
                    RadButton(
                      callback: () {
                        Navigator.pushNamed(context, AppRoutes.homepage);
                      },
                      page: AppRoutes.homepage,
                      textBtn: 'GO TO HOMEPAGE',
                      btnColor: Colors.white54,
                      context: context,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //
  }
}
