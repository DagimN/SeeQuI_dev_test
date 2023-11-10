import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String icon;
  final String title;
  const DrawerItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Row(children: [
          Image.asset(icon),
          const SizedBox(width: 20),
          Text(title)
        ]));
  }
}
