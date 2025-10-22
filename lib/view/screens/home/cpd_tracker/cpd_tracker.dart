import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/add_cpd_activity/add_cpd_activity.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpdTracker extends StatelessWidget {
  const CpdTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> statsList = [
      {
        "text1": "Activities Completed",
        "text2": "8",
      },
      {
        "text1": "Certificates Earned",
        "text2": "8",
      },
      {
        "text1": "Providers Used",
        "text2": "8",
      },
      {
        "text1": "Total Investment",
        "text2": "£451",
      },
      {
        "text1": "Competencies Covered",
        "text2": "8",
      },
      {
        "text1": "Compliance Rate",
        "text2": "8",
      },
    ];
    final List<Map<String, dynamic>> aiRecommendations = [
      {
        "title": "Professional Ethics Refresher",
        "desc":
            "Based on RICS requirements, consider a 2-hour ethics refresher course to maintain ethical standards compliance.",
        "tags": ["Formal CPD", "2 Hours", "High Priority"],
      },
      {
        "title": "Technical Reading: Sustainability Standards",
        "desc":
            "Emerging sustainability requirements in quantity surveying practice. Relevant to your competency gaps.",
        "tags": ["Informal CPD", "3.5 Hours", "Medium Priority"],
      },
    ];
    final List<Map<String, dynamic>> newEntryOptions = [
      {
        "title": "Log CPD Activity",
        "desc": "Record completed or planned learning activities",
        "icon": Assets.imagesAdd,
        "iconColor": ksecondary,
        "ontap": () => Get.to(() => AddCpdActivity()),
      },
      {
        "title": "AI Recommendations",
        "desc": "Get personalized CPD activity suggestions",
        "icon": Assets.imagesMagicpen,
        "ontap": () {},
      },
      {
        "title": "AI Guidance",
        "desc": "Export CPD record for RICS submission",
        "icon": Assets.imagesReport,
        "iconColor": ksecondary,
        "ontap": () {},
      },
    ];

    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'CPD Tracker',
            centerTitle: true,
            actions: [
              Bounce(
                child: Image.asset(
                  Assets.imagesBulb2,
                  width: 25,
                ),
              ),
              SizedBox(
                width: 12,
              )
            ]),
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
                  CustomeContainer(
                      radius: 10,
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      mtop: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Progress Overview',
                              size: 16,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 15,
                            ),
                            ExpandedRow(
                              text1: 'Questions',
                              text2: '22.1h / target hours',
                              size1: 14,
                              size2: 14,
                              fontFamily2: AppFonts.gilroyBold,
                              fontFamily: AppFonts.gilroyBold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            linearProgressIndicatorr(),
                            SizedBox(
                              height: 14,
                            ),
                            ExpandedRow(
                              text1: 'Formal',
                              text2: '22.1h / target hours',
                              size1: 14,
                              size2: 14,
                              fontFamily2: AppFonts.gilroyBold,
                              fontFamily: AppFonts.gilroyBold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            linearProgressIndicatorr(),
                            SizedBox(
                              height: 14,
                            ),
                            ExpandedRow(
                              text1: 'Informal',
                              text2: '22.1h / target hours',
                              size1: 14,
                              size2: 14,
                              fontFamily2: AppFonts.gilroyBold,
                              fontFamily: AppFonts.gilroyBold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            linearProgressIndicatorr(),
                          ])),
                  CustomeContainer(
                      radius: 10,
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: newEntryOptions.length,
                              itemBuilder: (context, index) {
                                final item = newEntryOptions[index];
                                return newEntry_container(
                                  title: item["title"],
                                  desc: item["desc"],
                                  icon: item["icon"],
                                  iconColor: item["iconColor"],
                                  ontap: item["ontap"],
                                );
                              },
                            ),
                          ])),
                  CustomeContainer(
                      radius: 10,
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            row_widget(
                              title: 'Recent Activities',
                              icon: Assets.imagesQuiz,
                              iconSize: 16,
                              fontFamily: AppFonts.gilroyBold,
                              rpad: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            recnet_activity_widget(),
                            SizedBox(
                              height: 10,
                            ),
                            recnet_activity_widget(
                              hastext2: false,
                              text1: 'Technical Article Reading',
                            )
                          ])),
                  CustomeContainer(
                      radius: 10,
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            row_widget(
                              title: 'This Year Summary',
                              fontFamily: AppFonts.gilroyBold,
                              icon: Assets.imagesQuiz,
                              iconSize: 16,
                              rpad: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: statsList.length,
                              itemBuilder: (context, index) {
                                final item = statsList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: ExpandedRow(
                                    text1: item["text1"]!,
                                    text2: item["text2"]!,
                                    size1: 11,
                                    size2: 14,
                                    fontFamily: AppFonts.gilroyMedium,
                                    fontFamily2: AppFonts.gilroyBold,
                                  ),
                                );
                              },
                            ),
                          ])),
                  CustomeContainer(
                      radius: 10,
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            row_widget(
                              title: 'Upcoming Planned Activities',
                              icon: Assets.imagesMagicpen,
                              iconSize: 16,
                              fontFamily: AppFonts.gilroyBold,
                              rpad: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            recnet_activity_widget(
                              text1: 'Annual surveying conference',
                              text2:
                                  '20 Oct 2025 | 16h | National surveying institute',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            recnet_activity_widget(
                              text1: 'Technical Article Reading',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                buttonContainer(
                                  radius: 50,
                                  bgColor: klighblue,
                                  borderColor: ksecondary,
                                  txtColor: kblueBorder2,
                                  text: 'Booking Required',
                                  vPadding: 3,
                                  textsize: 11,
                                )
                              ],
                            )
                          ])),
                  CustomeContainer(
                      radius: 10,
                      borderColor: kblueBorder2,
                      color: kblackfill,
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            row_widget(
                              title: 'AI Recommendations',
                              icon: Assets.imagesMagicpen,
                              iconSize: 16,
                              fontFamily: AppFonts.gilroyBold,
                              rpad: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: aiRecommendations.length,
                              itemBuilder: (context, index) {
                                final item = aiRecommendations[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TwoTextedColumn(
                                        text1: item["title"],
                                        text2: item["desc"],
                                        size1: 11,
                                        size2: 11,
                                        fontFamily: AppFonts.gilroyBold,
                                        fontFamily2: AppFonts.gilroyMedium,
                                        mBottom: 5,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 6,
                                        children: (item["tags"] as List<String>)
                                            .map((tag) => TagsWidget(tag))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            MyButton(
                              buttonText: 'Get Personalized AI Plans',
                              mTop: 20,
                              mBottom: 15,
                            )
                          ])),
                ],
              ),
            ),
          ],
        ));
  }
}

class recnet_activity_widget extends StatelessWidget {
  final String? text1, text2;
  final bool? hastext2;
  final String? buttonText, text3;
  final String? fontFamily1;
  final double? size1;
  const recnet_activity_widget({
    super.key,
    this.text1,
    this.text2,
    this.hastext2 = true,
    this.buttonText,
    this.text3,
    this.fontFamily1,
    this.size1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: text1 ?? 'RICS Professional Ethics Course',
                  size: size1 ?? 11,
                  fontFamily: fontFamily1 ?? AppFonts.gilroyMedium,
                  maxLines: null,
                  paddingRight: 6,
                ),
                buttonContainer(
                  text: buttonText ?? 'Formal',
                  textsize: 11,
                  vPadding: 2,
                  hPadding: 10,
                  bgColor: kblackfill,
                  borderColor: ksecondary,
                  radius: 4,
                ),
              ],
            ),
            MyText(
              text: text3 ?? '8h',
              size: 14,
              fontFamily: AppFonts.gilroyBold,
            ),
          ],
        ),
        if (hastext2 == true)
          MyText(
            text: text2 ?? 'RICS 15 Mar 2025',
            size: 11,
            fontFamily: AppFonts.gilroyMedium,
          ),
      ],
    );
  }
}
