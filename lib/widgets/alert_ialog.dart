import 'package:exam_at/core/colors.dart';
import 'package:exam_at/core/strings.dart';
import 'package:flutter/material.dart';

class DialogAlert extends StatelessWidget {
  String title;
  String content;
  BuildContext context;
  DialogAlert(
      {super.key,
      required this.title,
      required this.content,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return _dialog(context, title: title, content: content);
  }

  Widget _dialog(
    context, {
    required String title,
    required String content,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            Strings.ok,
            style: const TextStyle(
              color: TrivialRushColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
