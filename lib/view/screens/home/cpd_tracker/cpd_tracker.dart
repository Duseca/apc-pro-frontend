import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/export/export_data.dart';
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
      },
      {
        "title": "Technical Reading: Sustainability Standards",
        "desc":
            "Emerging sustainability requirements in quantity surveying practice. Relevant to your competency gaps.",
      },
    ];
    final List<Map<String, dynamic>> newEntryOptions = [
      {
        "title": "Log CPD Activity",
        "desc": "Record completed or planned learning activities",
        "icon": Assets.imagesAddc,
        "ontap": () => Get.to(() => AddCpdActivity()),
      },
      {
        "title": "AI Recommendations",
        "desc": "Get personalized CPD activity suggestions",
        "icon": Assets.imagesAi2,
        "ontap": () {},
      },
      {
        "title": "Export CPD Record",
        "desc": "Export CPD record for RICS submission",
        "icon": Assets.imagesDocument2,
        "ontap": () {
          Get.to(() => ExportData());
        },
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
                  color: getSecondaryColor(context),
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
                      radius: 8,
                      color: getfillcolor(context),
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
                              fontFamily2: AppFonts.gilroySemiBold,
                              fontFamily: AppFonts.gilroySemiBold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            linearProgressIndicatorr(
                              height: 6,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            ExpandedRow(
                              text1: 'Formal',
                              text2: '22.1h / target hours',
                              size1: 14,
                              size2: 14,
                              fontFamily2: AppFonts.gilroySemiBold,
                              fontFamily: AppFonts.gilroySemiBold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            linearProgressIndicatorr(
                              height: 6,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            ExpandedRow(
                              text1: 'Informal',
                              text2: '22.1h / target hours',
                              size1: 14,
                              size2: 14,
                              fontFamily2: AppFonts.gilroySemiBold,
                              fontFamily: AppFonts.gilroySemiBold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            linearProgressIndicatorr(
                              height: 6,
                            ),
                          ])),
                  MyText(
                    text: 'Quick Actions',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 10,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: newEntryOptions.length,
                    itemBuilder: (context, index) {
                      final item = newEntryOptions[index];
                      return newEntry_container(
                        bgColor: getfillcolor(context),
                        title: item["title"],
                        desc: item["desc"],
                        icon: item["icon"],
                        iconColor: getSecondaryColor(context),
                        iconSize: 18,
                        ontap: item["ontap"],
                      );
                    },
                  ),
                  MyText(
                    text: 'Recent Activities',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 10,
                  ),
                  CustomeContainer(
                      radius: 8,
                      color: getfillcolor(context),
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            recnet_activity_widget(
                              text2: 'RICS 15 Mar 2025  | 8 hrs',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color: getfifth(context),
                              ),
                            ),
                            recnet_activity_widget(
                              text2: 'RICS 15 Mar 2025  | 8 hrs',
                              text1: 'Technical Article Reading',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color: getfifth(context),
                              ),
                            ),
                          ])),
                  MyText(
                    text: 'This  Year Summary',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 10,
                  ),
                  CustomeContainer(
                      radius: 8,
                      color: getfillcolor(context),
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Progress Completed',
                              size: 14,
                              fontFamily: AppFonts.gilroySemiBold,
                              paddingBottom: 10,
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color: getfifth(context),
                              ),
                            ),
                            ExpandedRow(
                              text1: 'Total Instructions',
                              text2: '168',
                              size1: 11,
                              size2: 14,
                              fontFamily: AppFonts.gilroyMedium,
                              fontFamily2: AppFonts.gilroyBold,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            ExpandedRow(
                              text1: 'Compliance Rate',
                              text2: '84%',
                              size1: 11,
                              size2: 14,
                              fontFamily: AppFonts.gilroyMedium,
                              fontFamily2: AppFonts.gilroyBold,
                            )
                          ])),
                  MyText(
                    text: 'Upcoming Planned Activities',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 10,
                  ),
                  CustomeContainer(
                      radius: 10,
                      color: getfillcolor(context),
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                color: getfifth(context),
                              ),
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: recnet_activity_widget(
                                      text1: 'Annual surveying conference | 8h',
                                      text2:
                                          '20 Oct 2025 | 16h | National surveying institute',
                                    ));
                              },
                            ),
                          ])),
                  MyText(
                    text: 'AI Recommendations',
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 10,
                  ),
                  CustomeContainer(
                      radius: 10,
                      color: getfillcolor(context),
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            row_widget(
                              title: 'Personalized CPD Plans',
                              icon: Assets.imagesMagic2,
                              iconSize: 16,
                              fontFamily: AppFonts.gilroyBold,
                              rpad: 10,
                            ),
                            MyText(
                              text: 'Based on your progress & career goals',
                              size: 12,
                              paddingLeft: 20,
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
                                  child: CustomeContainer(
                                    color: getfifth(context),
                                    vpad: 12,
                                    hpad: 12,
                                    radius: 8,
                                    widget: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TwoTextedColumn(
                                          text1: item["title"],
                                          text2: '4 hours • Medium Priority',
                                          size1: 12,
                                          size2: 11,
                                          fontFamily: AppFonts.gilroyBold,
                                          fontFamily2: AppFonts.gilroyMedium,
                                          mBottom: 3,
                                        ),
                                        MyText(
                                            size: 11,
                                            paddingTop: 3,
                                            text: item['desc'])
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            MyButton(
                              buttonText: 'Get Personalized AI Plans',
                              mTop: 20,
                              mBottom: 15,
                              outlineColor: getSecondaryColor(context),
                              fontColor: getSecondaryColor(context),
                              backgroundColor: ktransparent,
                              fontFamily: AppFonts.gilroySemiBold,
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
  final double? size1, statusVpad;
  final Color? statusBgColor, statusTextColor;
  const recnet_activity_widget({
    super.key,
    this.text1,
    this.text2,
    this.hastext2 = true,
    this.buttonText,
    this.text3,
    this.fontFamily1,
    this.size1,
    this.statusBgColor,
    this.statusTextColor,
    this.statusVpad,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: MyText(
                text: text1 ?? 'RICS Professional Ethics Course',
                size: size1 ?? 12,
                fontFamily: fontFamily1 ?? AppFonts.gilroyMedium,
                maxLines: null,
                paddingRight: 6,
              ),
            ),
            buttonContainer(
              text: buttonText ?? 'Formal',
              textsize: 11,
              vPadding: statusVpad ?? 2,
              hPadding: 10,
              txtColor: statusTextColor,
              bgColor: statusBgColor ?? getfifth(context),
              radius: 4,
            ),
          ],
        ),
        if (hastext2 == true)
          MyText(
            text: text2 ?? 'RICS 15 Mar 2025',
            size: 12,
            fontFamily: AppFonts.gilroyMedium,
            color: getTertiary(context),
          ),
      ],
    );
  }
}
