import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';

import '../../../widgets/buttons/button.dart';

class ClimePrize extends StatelessWidget {
  const ClimePrize({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Claim prize',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(103, 0, 153, 0.8),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('''
                        If you're good enough to achieve a 
                        winning score, then you'll win the 
                        cash prize pool for the day. Go to 
                        the Claim Prize screen and send 
                        us your info and we will transfer 
                        your winnings to your PayPal 
                        account. Note: you can only win 
                        once every 30 days.'''),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/group4542.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: RadButton(
                      context: context,
                      callback: () {
                        Navigator.pushNamed(context, AppRoutes.homepage);
                      },
                      page: AppRoutes.homepage,
                      textBtn: 'Go to HomePage',
                      btnColor: const Color.fromRGBO(103, 0, 153, 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
