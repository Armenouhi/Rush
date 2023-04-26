import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  String text;
  Color textColor;
  StyleText({super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor
      ),
    );
  }
}
