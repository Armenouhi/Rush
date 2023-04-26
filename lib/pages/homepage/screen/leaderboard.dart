
import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
               child: Center(
                 child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Leaderboard',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(255,102,0, 0.8)
                    ),
                  ),
              ),
              const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '''
                       Your best score during each 24 
                        hour game period will appear 
                        on the Leaderboard. The 
                        highest eligible score each day 
                        will be the winner of the cash 
                        prize. Each day's prize pool will 
                        increase \$0.01 for each game 
                        played, but we will guarantee 
                        the first \$100.00.''',
                  ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(
                      'assets/group4541.png',
                      fit: BoxFit.cover,
                    ),
                  ),
              ),
            ],
          ),
               ),
        ),
      ),
    );
  }
}