import 'package:flutter/material.dart';

import 'menu/drawer_menu.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60.0),
        ),
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                height: 70,
                child: DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Color.fromRGBO(204,0,1, 0.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              
              MenuDrawer(
                icon: Icons.scoreboard,
                text: 'Scores',
              ),
              MenuDrawer(
                icon: Icons.payment,
                text: 'Prize Payout',
              ),
              MenuDrawer(
                icon: Icons.rule_folder,
                text: 'Rules',
              ),
              MenuDrawer(
                icon: Icons.call_merge_outlined,
                text: 'Support',
              ),
              MenuDrawer(
                icon: Icons.circle_notifications,
                text: 'About',
              ),
              MenuDrawer(
                icon: Icons.bookmark_add,
                text: 'Buy OurBbook',
              ),
              MenuDrawer(
                icon: Icons.sign_language_outlined,
                text: 'Sign Out',
              )
            ],
          ),
        ),
      ),
    );
  }
}
