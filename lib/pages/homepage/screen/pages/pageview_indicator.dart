import 'package:exam_at/pages/homepage/screen/pages/pages.dart';
import 'package:exam_at/providers/pages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget PageIndigator() {
  return ChangeNotifierProvider(
    create: (context) => PagesProvider(),
    child: Consumer<PagesProvider>(
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Visibility(
              visible: value.index < 3 ? true : false,
              child: SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const SwapEffect(paintStyle: PaintingStyle.fill),
                onDotClicked: ((index) {
                  value.showIndicator();
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                }),
              ),
            )),
          )
        ],
      ),
    ),
  );
}
