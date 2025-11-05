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
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApcDiary extends StatelessWidget {
  const ApcDiary({super.key});

  @override
  Widget build(BuildContext context) {
    
 final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                    radius: 10,
                    color: getfillcolor(context),
                   
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
                              bgColor: getsplashcolor(context),
                              txtColor: getTertiary(context),
                              text: '0% Complete',
                              vPadding: 5,
                              hPadding: 8,
                              textsize: 12,
                              fontFamily: AppFonts.gilroyRegular
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ExpandedRow(
                          text1: 'Days Logged: 0',
                          text2: 'Target: 200',
                       fontFamily2: AppFonts.gilroyMedium,
                       fontFamily: AppFonts.gilroyMedium,
                          color1: getTertiary(context),
                          color2: getTertiary(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                    linearProgressIndicatorr(
                      height: 4,
                      value: 1.0,
                      valueColor: getsplashcolor(context),
                      bgColor: getsplashcolor(context),
                    ),

                     SizedBox(height: 18,),
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
                              color2: getTertiary(context),
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
                                 color2: getTertiary(context),
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
                                 color2: getTertiary(context),
                            )
                          ],
                        )
                      ],
                    ),
                    mbott: 20,
                  ),
                  CustomeContainer(
                    radius: 10,
                    color: getfillcolor(context),
                   
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Ai Insights and Recommendations',
                            size: 14,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 18,
                          ),
                          TwoTextedColumn(
                            text1:
                                'You’re at 0% of your annual target.\nConsider logging more regular entries',
                            text2: 'Focus on logging entries for your technical core competencies',
                            size1: 12,
                            size2: 12,
                            fontFamily2: AppFonts.gilroyMedium,
                            fontFamily: AppFonts.gilroyMedium,
                            color2: getTertiary(context),
                            color1: getTertiary(context),
                            isExpanded: true,
                            mBottom: 7,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                       Row(
                        spacing: 7,
                         children: [
                           TagsWidget('View Tips'),
                            TagsWidget('Add Core Entry'),
                         ],
                       )
                        ]),
                    mbott: 20,
                  ),
                  newEntry_container(
                    ontap: () {
                      Get.to(() => NewDiaryDetails());

                    },
                    icon: isDarkMode?Assets.imagesNewentryd:Assets.imagesNewentry,
                  ),
                  newEntry_container(
                    title: 'View All Entries',
                    desc: 'Browse 2 entries',
                    icon:isDarkMode?Assets.imagesNewbookd: Assets.imagesNewbook,
                    ontap: () {
                      Get.to(() => ViewEntries());
                    },
                  ),
                  newEntry_container(
                    title: 'AI Guidance',
                    desc: 'Get personalized advice',
                    icon:isDarkMode?Assets.imagesMagicpend: Assets.imagesMagicpen,
                    ontap: () {},
                  ),

                  //competency progress
                  apc_competency_widget(),
                  apc_competencyLevel_widget(),
                  CustomeContainer(
                      mbott: 20,
                      radius: 10,
                      hpad: 14,
                      color: getfillcolor(context),
                   
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
                              color2: getSecondaryColor(context),
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
