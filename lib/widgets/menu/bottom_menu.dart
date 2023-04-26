import 'package:exam_at/widgets/text_style.dart';
import 'package:flutter/material.dart';

import '../../base/routes.dart';

class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return menu(context);
  }

  Widget menu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(103, 0, 153, 0.8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.quiz);
                              changeColors();
                            },
                            // ignore: sort_child_properties_last
                            child: const Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                color: Color.fromRGBO(103, 0, 153, 0.8),
                                size: 60,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(0),
                                backgroundColor: null),
                          ),
                        ),
                        StyleText(text: 'Play Now', textColor: Colors.white)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 153, 0, 0.8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.purchases);
                          },
                          // ignore: sort_child_properties_last
                          child: const Center(
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Color.fromRGBO(0, 153, 0, 0.8),
                              size: 60,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(5),
                              backgroundColor: null),
                        ),
                      ),
                      StyleText(text: 'Purchases', textColor: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
  
  void changeColors() {}
}
