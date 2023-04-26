import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  IconData icon;
  String text;
  MenuDrawer({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color.fromRGBO(204, 0, 1, 0.8),
        ),
        title: Text(text),
        textColor: const Color.fromRGBO(204, 0, 1, 0.8),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
