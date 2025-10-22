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
import 'package:apc_pro/view/screens/survey/cpd_studyPref.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
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
        appBar: simpleAppBar(context: context, haveBackButton: false),
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
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ksecondary,
                                blurRadius: 12,
                                spreadRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(color: kblueBorder2, width: 2)),
                        child: CommonImageView(
                          url: dummyImage,
                          radius: 100,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Expanded(
                          child: MyText(
                        paddingLeft: 8,
                        text: 'Good Morning John',
                        size: 15,
                        weight: FontWeight.bold,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      buttonContainer(
                        onTap: () {
                          Get.dialog(DailyUpdateDialog());
                        },
                        radius: 8,
                        borderColor: ksecondary,
                        bgColor: kbluefilled2,
                        txtColor: ksecondary,
                        text: 'Generate Daily Update',
                        weight: FontWeight.bold,
                        textsize: 11,
                      )
                    ],
                  ),
                  //
                  CustomeContainer(
                    mtop: 27,
                    //height: 500,
                    hpad: 18,
                    radius: 10,
                    color: kblackfill,
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          height: 120,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 15,
                                            backgroundColor:
                                                kblueBorder2.withOpacity(0.49),
                                            strokeCap: StrokeCap.round,
                                            value: 0.3,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    kblueBorder2),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MyText(
                                              text: 'Overall Progress',
                                              size: 12,
                                              weight: FontWeight.w400,
                                              paddingBottom: 5,
                                            ),
                                            MyText(
                                              text: '10%',
                                              size: 18,
                                              weight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 18,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: 'Today’s Actions',
                                            size: 18,
                                            weight: FontWeight.w800,
                                            paddingBottom: 5,
                                          ),
                                          checkbox_row(
                                            title:
                                                'Complete Today’s Diary Entry',
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          checkbox_row(
                                            title: 'Review Competency Program',
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          checkbox_row(
                                            title: 'Upgrade Summary Draft',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    mbott: 20,
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
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: home_deadline_widget(),
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
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: CustomeContainer(
                            radius: 8,
                            hpad: 14,
                            borderColor: kblueBorder3,
                            color: kblackfill,
                            widget: Row(children: [
                              Image.asset(
                                Assets.imagesAchievement,
                                width: 38,
                                height: 38,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    ExpandedRow(
                                      text1: 'First Steps',
                                      text2: 'Milestone',
                                      size1: 14,
                                      size2: 12,
                                      color2: kdarkSecondary,
                                      weight1: FontWeight.bold,
                                      weight2: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: MyText(
                                            text:
                                                'Completed profile setup Earned Today',
                                            size: 11,
                                            color: kwhite,
                                            fontFamily: AppFonts.gilroyMedium,
                                          ),
                                        ),
                                        MyText(
                                          text: 'Due: 14/04/24',
                                          size: 11,
                                          color: kwhite,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
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
