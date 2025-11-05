import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/screens/home/apc_diary.dart';
import 'package:apc_pro/view/screens/home/case_study/case_study.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/cpd_tracker.dart';
import 'package:apc_pro/view/screens/home/daily_update_dialog.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/submittion_planner.dart';
import 'package:apc_pro/view/screens/home/summary_experience/summary_experience.dart';
import 'package:apc_pro/view/screens/home/test_quiz/test_quiz.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<Map<String, dynamic>> homeOptions = [
      {
        "icon": Assets.imagesDiary,
        "text": "APC Diary",
        "onTap": () {
          Get.to(() => ApcDiary());
        },
      },
      {
        "icon": Assets.imagesSummary,
        "text": "Summary of Experience",
        "onTap": () {
          Get.to(() => SummaryExperience());
        },
      },
      {
        "icon": Assets.imagesCasestudy,
        "text": "Case Study",
        "onTap": () {
          Get.to(() => CaseStudy());
        },
      },
      {
        "icon": Assets.imagesTest,
        "text": "Test & Quiz",
        "onTap": () {
          Get.to(() => TestQuiz());
        },
      },
      {
        "icon": Assets.imagesCpdtracker,
        "text": "CPD Tracker",
        "onTap": () {
          Get.to(() => CpdTracker());
        },
      },
      {
        "icon": Assets.imagesSubmission,
        "text": "Submission Planner",
        "onTap": () {
          Get.to(() => SubmittionPlanner());
        },
      },
    ];

    return Scaffold(
        appBar: simpleAppBar(
            toolbarHeight: 62,
            context: context,
            haveBackButton: false,
            title2: Image.asset(
              Assets.imagesLogo3,
              width: 65,
              height: 19,
              color: isDarkMode ? null : kblack,
            ),
            hasNonTextedTitle: true,
            centerTitle: true,
            actions: [
              Bounce(
                  child: Image.asset(
                Assets.imagesBellIcon,
                width: 22,
                color: isDarkMode ? null : kblack,
              )),
              SizedBox(
                width: 14,
              )
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      CommonImageView(
                        url: dummyImage,
                        radius: 100,
                        width: 50,
                        height: 50,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            paddingLeft: 8,
                            text: 'Good Morning John',
                            size: 15,
                            weight: FontWeight.bold,
                            paddingBottom: 2,
                          ),
                          MyText(
                            text:
                                'APC Candidate\nQuantity Surveying and Construction',
                            color: getTertiary(context),
                            paddingLeft: 8,
                            lineHeight: 1.5,
                          )
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Assets.imagesLogo1,
                        width: 44,
                        height: 44,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: buttonContainer(
                          onTap: () {
                            Get.dialog(DailyUpdateDialog());
                          },
                          radius: 8,
                          bgColor: getfillcolor(context),
                          txtColor: getSecondaryColor(context),
                          text: 'Generate Daily Update',
                          fontFamily: AppFonts.gilroyMedium,
                          textsize: 12,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circular_indicator_stack(),
                      circular_indicator_stack(
                        title: 'CPD',
                      ),
                      circular_indicator_stack(
                        title: 'Case Study',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 15,
                    hpad: 14,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TwoTextedColumn(
                                text1: "Complete Today's Diary Entry",
                                text2:
                                    "Don’t forget to fill in your diary before the day ends.",
                                size1: 14,
                                size2: 12,
                                color2: getTertiary(context),
                                fontFamily: AppFonts.gilroyBold,
                                fontFamily2: AppFonts.gilroyRegular,
                                mBottom: 1,
                              ),
                            ),
                            CustomeContainer(
                              vpad: 3,
                              hpad: 3,
                              radius: 5,
                              color: getsplashcolor(context),
                              widget: Column(
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: getSecondaryColor(context),
                                    size: 12,
                                  ),
                                  MyText(
                                    text: '3',
                                    color: getSecondaryColor(context),
                                    paddingTop: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        row_widget(
                          title: 'View Now',
                          iconData: Icons.keyboard_arrow_right_rounded,
                          isIconRight: true,
                          decor: TextDecoration.underline,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    itemCount: homeOptions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 105,
                    ),
                    itemBuilder: (context, index) {
                      final item = homeOptions[index];
                      return home_opts_container(
                        text: item["text"],
                        icon: item["icon"],
                        ontap: homeOptions[index]["onTap"],
                      );
                    },
                  ),
                  MyText(
                    text: 'Upcoming Deadlines',
                    size: 18,
                    weight: FontWeight.bold,
                    paddingBottom: 14,
                    paddingTop: 20,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: home_deadline_widget(),
                      );
                    },
                  ),
                  MyText(
                    text: 'Recent Achievements',
                    size: 18,
                    weight: FontWeight.bold,
                    paddingBottom: 14,
                    paddingTop: 4,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: CustomeContainer(
                            radius: 8,
                            hpad: 14,
                            vpad: 15,
                            color: getfillcolor(context),
                            widget: Row(children: [
                              Image.asset(
                                index == 0
                                    ? Assets.imagesDailystreak
                                    : Assets.imagesCasetudy,
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TwoTextedColumn(
                                  text1: index == 0
                                      ? 'Diary Streak: 7 Days'
                                      : 'Case Study Complete',
                                  text2: index == 0
                                      ? 'Keep up the great work!'
                                      : 'Commercial project analysis',
                                  size1: 14,
                                  size2: 12,
                                  color2: getTertiary(context),
                                  fontFamily: AppFonts.gilroyBold,
                                  fontFamily2: AppFonts.gilroyRegular,
                                  mBottom: 1,
                                ),
                              ),
                            ])),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
