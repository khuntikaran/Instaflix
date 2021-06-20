import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get/get.dart';
import 'package:instaflix/controller/BottomNavController.dart';

import 'package:instaflix/screens/explore.dart';
import 'package:instaflix/screens/home.dart';
import 'package:instaflix/screens/user.dart';

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  final List<Widget> pages = [
    Home(),
    Explore(),
    User(),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(
      BottomNavController(),
    );
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavController.currentIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          itemCornerRadius: 250,
          curve: Curves.decelerate,
          backgroundColor: Colors.black.withOpacity(0.9),
          animationDuration: Duration(milliseconds: 500),
          items: [
            BottomNavyBarItem(
              activeColor: Colors.red.shade200,
              inactiveColor: Colors.blue.shade200,
              icon: Icon(Icons.home_filled),
              title: Text(''),
            ),
            BottomNavyBarItem(
              activeColor: Colors.red.shade200,
              inactiveColor: Colors.blue.shade200,
              icon: Icon(
                Icons.video_collection_rounded,
              ),
              title: Text(''),
            ),
            BottomNavyBarItem(
              activeColor: Colors.red.shade200,
              inactiveColor: Colors.blue.shade200,
              icon: Icon(Icons.person),
              title: Text(''),
            ),
          ],
          onItemSelected: bottomNavController.onSelected,
          selectedIndex: bottomNavController.currentIndex.value,
        ),
      ),
    );
  }
}
