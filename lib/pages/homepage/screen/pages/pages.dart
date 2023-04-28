import 'package:exam_at/pages/homepage/screen/pages/pageview_indicator.dart';
import 'package:exam_at/pages/homepage/screen/clime_prize.dart';
import 'package:exam_at/pages/homepage/screen/games.dart';
import 'package:exam_at/pages/homepage/screen/leaderboard.dart';
import 'package:exam_at/pages/homepage/screen/score.dart';
import 'package:exam_at/providers/pages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PageController controller = PageController(
  initialPage: 0,
);

List<Widget> pages = const [Games(), Score(), LeaderBoard(), ClimePrize()];

class Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContext();
  }

  Widget _buildContext() {
    return DefaultTabController(
      length: pages.length,
      child: ChangeNotifierProvider(
        create: (context) => PagesProvider(),
        child: Scaffold(
          // ignore: avoid_unnecessary_containers
          body: Consumer<PagesProvider>(
            builder: (context, value, child) => Stack(
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(),
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return pages[index];
                      },
                      itemCount: pages.length,
                      controller: controller,
                    )),
                PageIndigator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
