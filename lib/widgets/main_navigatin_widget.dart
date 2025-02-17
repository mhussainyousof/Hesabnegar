import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/constant.dart';

import '../controllers/navigation_controller.dart';

class MyNavigationbarWidget extends StatelessWidget {
  const MyNavigationbarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final mainController = Get.find<MainController>();

    return Obx(() {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: AnimatedBottomNavigationBar(
          height: 60,
          backgroundGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.amber, Colors.orangeAccent], 
          ),
          activeColor: kredcolor, 
          inactiveColor: Colors.black54, 
          icons: const [Icons.home, Icons.info], 
          activeIndex: mainController.index.value,
          onTap: mainController.changePage, 
          gapLocation: GapLocation.center, 
          notchSmoothness: NotchSmoothness.defaultEdge, 
        ),
      );
    });
  }
}