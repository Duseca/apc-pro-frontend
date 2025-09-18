import 'dart:developer';
import 'dart:io';

import 'package:apc_pro/view/screens/home/home.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  int? index;

  BottomNavBar({super.key, this.index = 0});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Map<String, dynamic>> items;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index ?? 0;
    updateItems();
  }

  void updateItems() {
    items = [
      {
        'image': currentIndex == 0
            ? Assets.imagesHomefilled
            : Assets.imagesHomeunfilled,
        'label': 'Home'.tr,
      },
      {
        'image': currentIndex == 1
            ? Assets.imagesCommunityfilled
            : Assets.imagesCommunityunfilled,
        'label': 'Earnings'.tr,
      },
      {
        // Placeholder for FAB notch
        'image': '',
        'label': '',
      },
      {
        'image': currentIndex == 2
            ? Assets.imagesNotificationfilled
            : Assets.imagesNotificationunfilled,
        'label': 'Reviews'.tr,
      },
      {
        'image': currentIndex == 3
            ? Assets.imagesProfilefilled
            : Assets.imagesProfileunfilled,
        'label': 'Profile'.tr,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [Home(), Home(), Home(), Home(), Home()];

    return Scaffold(
      backgroundColor: kbackground,
      body: screens[currentIndex],
      bottomNavigationBar: BottomAppBar(
         shape: const CircularNotchedRectangle(), 
        notchMargin: 0,
        
        color: kbackground,
        child: SizedBox(
          height: Platform.isIOS ? 90 : 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(0),
              buildNavItem(1),
              const SizedBox(width: 30),
              buildNavItem(3),
              buildNavItem(4),
            ],
          ),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kbackground,
        onPressed: () {
          Get.to(() => Home());
        },
        child: Image.asset(
          Assets.imagesApcAI,
          width: 66,
          height: 55,
        ),
      ),
    );
  }

  Widget buildNavItem(int index) {
    bool isSelected = currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
          updateItems();
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (items[index]['image'] != '')
            Image.asset(
              items[index]['image'],
              width: 23.7,
              height: 25,
            ),
          if (items[index]['label'] != '')
            MyText(
              text: items[index]['label'],
              fontFamily: AppFonts.gilroyMedium,
              size: 12,
              weight: isSelected ? FontWeight.w500 : FontWeight.w500,
              color: isSelected ? ksecondary : kwhite,
            ),
        ],
      ),
    );
  }
}
