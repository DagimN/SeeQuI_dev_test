import 'package:dev_test/components/drawer_item.dart';
import 'package:dev_test/config/path.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
        alignment: Alignment.topLeft,
        height: screenHeight * .48,
        width: 240,
        child: const Column(children: [
          SizedBox(height: 20),
          DrawerItem(icon: AppIcons.post, title: 'Post a Sequel'),
          DrawerItem(icon: AppIcons.heart, title: 'View your likes'),
          DrawerItem(icon: AppIcons.fan, title: 'Your Sequel Posts'),
          DrawerItem(icon: AppIcons.reference, title: 'Reference contribution'),
          DrawerItem(icon: AppIcons.hashtag, title: 'Hashtag Challenges'),
          DrawerItem(icon: AppIcons.notification, title: 'Notifications'),
          DrawerItem(icon: AppIcons.about, title: 'About SeeQuI'),
          SizedBox(height: 10),
        ]));
  }
}
