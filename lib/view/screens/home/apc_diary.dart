import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/entries/view_entries.dart';
import 'package:apc_pro/view/screens/home/new_diary/new_diary_details.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApcDiary extends StatelessWidget {
  const ApcDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'APC Diary',
            centerTitle: true,
            actions: [
              Bounce(
                child: Image.asset(
                  Assets.imagesBulb2,
                  width: 26,
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
                    color: kblackfill,
                    borderColor: kblueBorder2,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: MyText(
                              text: 'Annual Progress',
                              size: 14,
                              fontFamily: AppFonts.gilroyBold,
                            )),
                            buttonContainer(
                              radius: 50,
                              bgColor: klighblue,
                              txtColor: ksecondary,
                              text: '0% Complete',
                              vPadding: 6,
                              hPadding: 8,
                              fontFamily: AppFonts.gilroyBold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ExpandedRow(
                          text1: 'Days Logged: 0',
                          text2: 'Target: 200',
                          weight1: FontWeight.w500,
                          weight2: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(20),
                          color: ksecondary.withOpacity(0.4),
                          minHeight: 12,
                          value: 0.0,
                          backgroundColor: ksecondary.withOpacity(0.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Divider(
                            color: ksecondary.withOpacity(0.5),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TwoTextedColumn(
                              text1: '2',
                              text2: 'Total Entries',
                              size1: 20,
                              size2: 12,
                              weight1: FontWeight.bold,
                              weight2: FontWeight.w500,
                              align: TextAlign.center,
                              alignment: ColumnAlignment.center,
                              fontFamily: AppFonts.gilroySemiBold,
                              fontFamily2: AppFonts.gilroyMedium,
                            ),
                            TwoTextedColumn(
                              text1: '2',
                              text2: 'Current streak',
                              size1: 20,
                              size2: 12,
                              weight1: FontWeight.bold,
                              weight2: FontWeight.w500,
                              align: TextAlign.center,
                              alignment: ColumnAlignment.center,
                              fontFamily: AppFonts.gilroySemiBold,
                              fontFamily2: AppFonts.gilroyMedium,
                            ),
                            TwoTextedColumn(
                              text1: '2',
                              text2: 'Competencies',
                              size1: 20,
                              size2: 12,
                              weight1: FontWeight.bold,
                              weight2: FontWeight.w500,
                              align: TextAlign.center,
                              alignment: ColumnAlignment.center,
                              fontFamily: AppFonts.gilroySemiBold,
                              fontFamily2: AppFonts.gilroyMedium,
                            )
                          ],
                        )
                      ],
                    ),
                    mbott: 20,
                  ),
                  CustomeContainer(
                    radius: 10,
                    color: kblackfill,
                    borderColor: kblueBorder2,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Ai Insights and Recommendations',
                            size: 14,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 18,
                          ),
                          ExpandedRow(
                            text1:
                                'You’re at 0% of your annual target.\nConsider logging more regular entries',
                            text2: 'View Tips',
                            size1: 12,
                            size2: 11,
                            fontFamily2: AppFonts.gilroyBold,
                            fontFamily: AppFonts.gilroyMedium,
                            color2: klighblue,
                            isExpanded: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ExpandedRow(
                            text1:
                                'Focus on logging entries for your technical core competencies',
                            text2: 'Add Core Entry',
                            size1: 12,
                            size2: 11,
                            fontFamily2: AppFonts.gilroyBold,
                            fontFamily: AppFonts.gilroyMedium,
                            color2: klighblue,
                            isExpanded: true,
                          )
                        ]),
                    mbott: 20,
                  ),
                  newEntry_container(
                    ontap: () {
                      Get.to(() => NewDiaryDetails());
                    },
                  ),
                  newEntry_container(
                    title: 'View All Entries',
                    desc: 'Browse 2 entries',
                    icon: Assets.imagesNewbook,
                    ontap: () {
                      Get.to(() => ViewEntries());
                    },
                  ),
                  newEntry_container(
                    title: 'AI Guidance',
                    desc: 'Get personalized advice',
                    icon: Assets.imagesMagicpen,
                    ontap: () {},
                  ),

                  //competency progress
                  apc_competency_widget(),
                  apc_competencyLevel_widget(),
                  CustomeContainer(
                      mbott: 20,
                      radius: 10,
                      hpad: 14,
                      color: kblackfill,
                      borderColor: kblueBorder3,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpandedRow(
                              text1: 'Recent Activity',
                              text2: 'View All',
                              size1: 14,
                              size2: 12,
                              fontFamily2: AppFonts.gilroyBold,
                              fontFamily: AppFonts.gilroyBold,
                              color2: klighblue,
                              isExpanded: true,
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: index == 0
                                        ? recent_activity_row()
                                        : recent_activity_row(
                                            title: 'Building Defects',
                                            desc:
                                                'Attended site meeting to assess cracking',
                                          ));
                              },
                            ),
                          ]))
                ],
              ),
            ),
          ],
        ));
  }
}
