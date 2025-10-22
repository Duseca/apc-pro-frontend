import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/add_cpd_activity/cpd_basicInfo.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/add_cpd_activity/cpd_details.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/add_cpd_activity/cpd_learning.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/add_cpd_activity/cpd_reflection.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCpdActivity extends StatelessWidget {
  const AddCpdActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ["Basic", 'Learning', 'Reflection', 'Details'];
    final List<Widget> tabContents = [
      CpdBasicinfo(),
      CpdLearning(),
      CpdReflection(),
      CpdDetails()
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Add CPD Activity', centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Obx(
                    () => TabsWidget(
                      height: 43,
                      margin: 2,
                      bgColor: kblackfill,
                      textSize: 11,
                      items: tabs,
                      currentindex: currentIndex.value,
                      ontap: (p0) {
                        currentIndex.value = p0;
                      },
                    ),
                  ),
                  Obx(() => tabContents[currentIndex.value]),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
