import 'package:exam_at/pages/homepage/screen/clime_prize.dart';
import 'package:exam_at/pages/homepage/screen/games.dart';
import 'package:exam_at/pages/homepage/screen/leaderboard.dart';
import 'package:exam_at/pages/homepage/screen/score.dart';
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  // ignore: prefer_final_fields
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
            margin: const EdgeInsets.symmetric(),
            child: PageView(
              controller: _controller,
              children: const [Games(), Score(), LeaderBoard(), ClimePrize()],
            )),
      ),
    );
  }
}
