import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  VoidCallback onPressed;
  String textBtn;
  TextBtn({super.key, required this.textBtn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return btn(textBtn);
  }

  Widget btn(String text) { 
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromRGBO(204, 0, 1, 0.8),
      ),
      child: Text(text),
    );
  }
}
