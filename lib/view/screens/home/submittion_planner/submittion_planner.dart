import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/add_cpd_activity/add_cpd_activity.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/cpd_tracker.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/ai_planning_assistant.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/view_submittion_calender.dart';
import 'package:apc_pro/view/screens/home/test_quiz/test_quiz_widget.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/submittion_planner_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmittionPlanner extends StatelessWidget {
  const SubmittionPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> progressList = [
      {
        "title": "Diary Progress: 45%",
        "percentage": 'Progress: 45%',
        "milestones": "1/2 milestones",
      },
      {
        "title": "Summary of Experience 28%",
        "percentage": 28,
        "milestones": "0/1 milestones",
      },
      {
        "title": "Case Study 24%",
        "percentage": 24,
        "milestones": "0/1 milestones",
      },
      {
        "title": "CPD 30%",
        "percentage": 30,
        "milestones": "0/1 milestones",
      },
    ];

    final List<Map<String, dynamic>> aiRecommendations = [
      {
        "title": "Accelerate Diary Completion",
        "desc":
            "Based on your current progress, consider increasing diary logging frequency to 4–5 entries per week to ensure you meet the 200-day requirement before your assessment date.",
        "tags": ["Time management", "High Impact"],
      },
      {
        "title": "Schedule Mock Interview Practice",
        "desc":
            "Book at least 3 mock interview sessions 4–6 weeks before your assessment. This aligns with your case study completion timeline.",
        "tags": ["Interview prep", "Medium Priority"],
      },
      {
        "title": "CPD Balance Optimization",
        "desc":
            "You're ahead on informal CPD but behind on formal learning. Consider booking structured courses or webinars to balance your 10-hour formal requirement.",
        "tags": ["CPD Planning", "Medium Priority"],
      },
    ];

    final List<Map<String, dynamic>> newEntryOptions = [
      {
        "title": "View Calendar",
        "icon": Assets.imagesCalendar,
        "ontap": () => Get.to(() => ViewSubmittionCalender()),
      },
      {
        "title": "Add Task",
        "icon": Assets.imagesAdd,
        "ontap": () {
          Get.to(() => ViewSubmittionCalender());
        },
      },
      {
        "title": "AI Planning",
        "icon": Assets.imagesMagic2,
        "ontap": () {},
      },
    ];
    final List<Map<String, dynamic>> milestones = [
      {
        "title": "Section Complete",
        "priority": "High",
        "percentage": 'Progress: 45%',
        "due": "Due in 7 months",
      },
      {
        "title": "Finalize Summary of Experience",
        "priority": "High",
        "percentage": 'Progress: 45%',
        "due": "Due in 8 months",
      },
      {
        "title": "Complete Case Study",
        "priority": "High",
        "percentage": 'Progress: 45%',
        "due": "Due in 8 months",
      },
      {
        "title": "Complete CPD Requirements",
        "priority": "Medium",
        "percentage": 'Progress: 45%',
        "due": "Due in 9 months",
      },
      {
        "title": "Complete Mock Interviews",
        "priority": "High",
        "percentage": 'Progress: 45%',
        "due": "Due in 9 months",
      },
    ];

    final savedQuizzes = [
      {
        'title': 'Log weekly diary entries',
        'time': 'Research Portfolio • High Priority'
      },
      {
        'title': 'Draft conclusions chapter',
        'time': 'Final Thesis • Medium Priority'
      },
    ];
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Submission Planner',
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
                      radius: 10,
                      color: getfillcolor(context),
                      vpad: 11,
                      hpad: 12,
                      mbott: 20,
                      mtop: 20,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Submission Progress Overview',
                              size: 14,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 20,
                            ),
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: progressList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      mainAxisExtent: 80),
                              itemBuilder: (context, index) {
                                final item = progressList[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MyText(
                                      text: item["title"],
                                      fontFamily: AppFonts.gilroySemiBold,
                                      textAlign: TextAlign.center,
                                      size: 11.5,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    linearProgressIndicatorr(
                                      value: 0.47,
                                      height: 6,
                                    ),
                                    MyText(
                                      text: item["milestones"],
                                      size: 11,
                                      fontFamily: AppFonts.gilroyMedium,
                                      paddingTop: 8,
                                      color: getTertiary(context),
                                    ),
                                  ],
                                );
                              },
                            )
                          ])),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Quick Actions',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 20,
                        ),
                        GridView.builder(
                          itemCount: newEntryOptions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 95,
                          ),
                          itemBuilder: (context, index) {
                            final item = newEntryOptions[index];
                            return home_opts_container(
                              text: item["title"],
                              icon: item["icon"],
                              iconColor: getSecondaryColor(context),
                              ontap:newEntryOptions[index]["ontap"],
                            );
                          },
                        ),
                      ]),
                  MyText(
                    text: 'Upcoming Milestones',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 15,
                    paddingTop: 20,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: milestones.length,
                    itemBuilder: (context, index) {
                      final item = milestones[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CustomeContainer(
                          color: getfillcolor(context),
                          radius: 8,
                          vpad: 17,
                          hpad: 17,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              recnet_activity_widget(
                                buttonText: item["priority"],
                                text1: item["title"],
                                statusBgColor: kred2.withOpacity(0.2),
                                statusTextColor: kred2,
                                statusVpad: 4,
                                size1: 11.5,
                                fontFamily1: AppFonts.gilroyBold,
                              ),
                              MyText(
                                paddingTop: 1,
                                text: item["due"],
                                size: 12,
                                color: getTertiary(context),
                                paddingBottom: 8,
                                fontFamily: AppFonts.gilroyMedium,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: MyText(
                                      text: item['percentage'],
                                      size: 12,
                                      fontFamily: AppFonts.gilroyMedium,
                                      paddingBottom: 8,
                                    ),
                                  ),
                                  row_widget(
                                    title: 'Dec 28',
                                    icon: Assets.imagesCalendar,
                                    iconSize: 15,
                                    texSize: 11,
                                    iconColor: getTertiary(context),
                                    textColor: getTertiary(context),
                                  )
                                ],
                              ),
                              linearProgressIndicatorr(
                                value: 0.47,
                                height: 6,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: MyText(
                        text: 'Active Tasks',
                        size: 14,
                        fontFamily: AppFonts.gilroyBold,
                      )),
                      buttonContainer(
                        radius: 8,
                        vPadding: 6,
                        hPadding: 10,
                        text: 'Add Task',
                        bgColor: getsplashcolor(context),
                        borderColor: getSecondaryColor(context),
                        icon: Icons.add_rounded,
                        iconColor: getSecondaryColor(context),
                        textsize: 11,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: savedQuizzes.length,
                        itemBuilder: (context, index) {
                          final quiz = savedQuizzes[index];
                          return active_task_container(
                            text1: quiz['title']!,
                            text2: quiz['time']!,
                          );
                        },
                      ),
                    ],
                  ),
                  MyText(
                    text: 'AI Recommendations',
                    fontFamily: AppFonts.gilroyBold,
                    size: 16,
                  ),
                  CustomeContainer(
                      mtop: 16,
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
                              iconSize: 20,
                              fontFamily: AppFonts.gilroyBold,
                              iconColor: getSecondaryColor(context),
                              rpad: 10,
                              texSize: 14,
                            ),
                            MyText(
                              text: 'Based on your progress & career goals',
                              color: getTertiary(context),
                              paddingLeft: 25,
                              paddingTop: 2,
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
                                    vpad: 12,
                                    hpad: 12,
                                    radius: 8,
                                    color: getfifth(context),
                                    widget: Column(
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
                                          color2: getTertiary(context),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 6,
                                          children:
                                              (item["tags"] as List<String>)
                                                  .map((tag) => TagsWidget(tag))
                                                  .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            MyButton(
                              buttonText: 'Get Personalized AI Plans',
                              mBottom: 15,
                              outlineColor: getSecondaryColor(context),
                              backgroundColor: ktransparent,
                              fontColor: getSecondaryColor(context),
                              onTap: () {
                                Get.to(() => AiPlanningAssistant());
                              },
                            )
                          ])),
                ],
              ),
            ),
          ],
        ));
  }
}
