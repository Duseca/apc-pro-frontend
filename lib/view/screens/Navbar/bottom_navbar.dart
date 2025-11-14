
import 'dart:io';
import 'package:apc_pro/view/screens/cpd_events/cpd_events.dart';
import 'package:apc_pro/view/screens/home/home.dart';
import 'package:apc_pro/view/screens/jobs/job.dart';
import 'package:apc_pro/view/screens/profile/profile.dart';
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
        'image':  Assets.imagesHomeunfilled,
        'label': 'Home'.tr,
      },
      {
        'image':  Assets.imagesDocument,
        'label': 'CPD'.tr,
      },
      {
        // Placeholder for FAB notch
        'image': Assets.imagesLogo1,
        'label': '',
      },
      {
        'image': Assets.imagesNotificationunfilled,
        'label': 'Jobs'.tr,
      },
      {
        'image':  Assets.imagesProfileunfilled,
        'label': 'Profile'.tr,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
     final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> screens = [
      Home(),
      CpdEvents(),
      Home(),
     Job(),
      Profile()
    ];

    return Scaffold(
  
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        decoration: BoxDecoration(
color: getfillcolor(context),
          borderRadius: BorderRadius.circular(40),
          
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomAppBar(
            
            // shape: const CircularNotchedRectangle(),
            // notchMargin: 0,
            color: getfillcolor(context),
            child: SizedBox(
              height: Platform.isIOS ? 90 : 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem(0),
                  buildNavItem(1),
                  buildNavItem(2)
,                  buildNavItem(3),
                  buildNavItem(4),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  Widget buildNavItem(int index) {
  bool isSelected = currentIndex == index;

  // ✅ Special case for center icon (index 2)
  if (index == 2) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
          updateItems();
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Image.asset(
          Assets.imagesLogo1, // your center icon
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  // ✅ Normal navigation items
  return InkWell(
    onTap: () {
      setState(() {
        currentIndex = index;
        updateItems();
      });
    },
    child: SizedBox(
      width: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            items[index]['image'],
            width: 20,
            height: 20,
            color: isSelected
                ? getSecondaryColor(context)
                : getTertiary(context),
          ),
          const SizedBox(height: 3),
          MyText(
            text: items[index]['label'],
            fontFamily: AppFonts.gilroyMedium,
            size: 11,
            weight: FontWeight.w500,
            textAlign: TextAlign.center,
            color: isSelected
                ? getSecondaryColor(context)
                : getTertiary(context)
          ),
        ],
      ),
    ),
  );
}

}
