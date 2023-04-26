import 'package:flutter/material.dart';

class DiagonallyShapedCard extends StatelessWidget {
  int index;
  double width, height;
  Color color;
  DiagonallyShapedCard({
    super.key,
    required this.index,
    required this.width,
    required this.height,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return diagonallyShaped(index, width, height, color);
  }

  Widget diagonallyShaped(int i, double width, double height, color) {
    return SizedBox(
      width: width,
      height: height,
      // ignore: prefer_const_constructors
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        color: color,
        // ignore: prefer_const_constructors
        child: Center(
          child: Text(
            '$i',
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
