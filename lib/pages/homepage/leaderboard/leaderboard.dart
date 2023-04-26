import 'package:exam_at/pages/homepage/leaderboard/leaderboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderBord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LeaderBoarderProvider(),
      child: Consumer<LeaderBoarderProvider>(
        builder: (context, value, child) => value.isLoading == true
            ? const Center(
          child: CircularProgressIndicator.adaptive(),
        )
            : Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'LeaderBoarder',
                style: TextStyle(color: Colors.white),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromRGBO(255, 102, 0, 0.8),
          ),
          body: ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (context, index) => Container(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 3, bottom: 3),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                      side: BorderSide(
                        color: Color.fromARGB(255, 189, 187, 187),
                        //<-- SEE HERE
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(7),
                              child: Text('${index + 1}')),
                          if (value.list[index].userImageUrl != null)
                            CircleAvatar(
                              radius: 40, // Image radius
                              backgroundImage: NetworkImage(
                                  '${value.list[index].userImageUrl}'),
                            )
                          else
                            CircleAvatar(
                              radius: 40,
                              backgroundColor:
                              value.colors[index],
                              child: Text(
                                // ignore: unnecessary_string_interpolations
                                '${value.list[index].firstName![0]}',
                                style: const TextStyle(fontSize: 35),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 7),
                            child: Text(
                              '${value.list[index].firstName}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              child: Text(
                                '${value.list[index].score}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}