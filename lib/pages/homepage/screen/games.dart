import 'package:flutter/material.dart';

class Games extends StatelessWidget {
  const Games({super.key});

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
                    'Play Game',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(204, 0, 1, 0.8),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '''
                        You will receive 5 free plays a day 
                        and you can purchase additional 
                        plays that never expire. 
                        Questions are progressive, 
                        increasing in difficulty and value 
                        from easy to hard and 1 to 10 
                        points.''',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(
                      'assets/group4539.png',
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
