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
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
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
        "title": "Diary",
        "percentage": 47,
        "milestones": "1/2 milestones",
      },
      {
        "title": "Summary of Experience",
        "percentage": 28,
        "milestones": "0/1 milestones",
      },
      {
        "title": "Case Study",
        "percentage": 24,
        "milestones": "0/1 milestones",
      },
      {
        "title": "CPD",
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
        "desc": "See all milestones and deadlines in calendar view",
        "icon": Assets.imagesCalendar,
        "iconColor": ksecondary,
        "ontap": () =>Get.to(() => ViewSubmittionCalender()),
      },
      {
        "title": "Add Task",
        "desc": "Create new tasks and personal deadlines",
        "icon": Assets.imagesAdd,
        "iconColor": ksecondary,
        "ontap": () {
          Get.to(() => ViewSubmittionCalender());
        },
      },
      {
        "title": "AI Planning",
        "desc": "Get personalized submission plan recommendations",
        "icon": Assets.imagesMagicpen,
        "iconColor": ksecondary,
        "ontap": () {},
      },
    ];
    final List<Map<String, dynamic>> milestones = [
      {
        "title": "Section Complete",
        "priority": "High",
        "percentage": 47,
        "due": "Due in 7 months",
      },
      {
        "title": "Finalize Summary of Experience",
        "priority": "High",
        "percentage": 47,
        "due": "Due in 8 months",
      },
      {
        "title": "Complete Case Study",
        "priority": "High",
        "percentage": 47,
        "due": "Due in 8 months",
      },
      {
        "title": "Complete CPD Requirements",
        "priority": "Medium",
        "percentage": 47,
        "due": "Due in 9 months",
      },
      {
        "title": "Complete Mock Interviews",
        "priority": "High",
        "percentage": 47,
        "due": "Due in 9 months",
      },
    ];

    final savedQuizzes = [
      {'title': 'Log weekly diary entries', 'time': 'Diary management  |  120 min  | Due in 7 days'},
    ];
    return Scaffold(
        backgroundColor: kbackground,
        appBar: simpleAppBar(
            context: context,
            title: 'Submission Planner',
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
                      borderColor: kblueBorder3,
                      color: kblackfill,
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
                                    TwoTextedColumn(
                                      text1: item["title"],
                                      text2: "${item["percentage"]}%",
                                      size1: 12,
                                      size2: 12,
                                      fontFamily2: AppFonts.gilroyBold,
                                      fontFamily: AppFonts.gilroyMedium,
                                      align: TextAlign.center,
                                      maxLines: 1,
                                      alignment: ColumnAlignment.center,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    linearProgressIndicatorr(
                                      value: (item["percentage"] as int) / 100,
                                    ),
                                    MyText(
                                      text: item["milestones"],
                                      size: 11,
                                      fontFamily: AppFonts.gilroyMedium,
                                      paddingTop: 6,
                                    ),
                                  ],
                                );
                              },
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
                            MyText(
                              text: 'Quick Actions',
                              size: 14,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 20,
                            ),
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
                                  borderColor: Color(0xff4285F4),
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
                            MyText(
                              text: 'Upcoming Milestones',
                              size: 16,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 10,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      recnet_activity_widget(
                                        buttonText: item["priority"],
                                        text1: item["title"],
                                        text3: "${item["percentage"]}%",
                                        hastext2: false,
                                        size1: 11.5,
                                        fontFamily1: AppFonts.gilroyBold,
                                      ),
                                      SizedBox(height: 8),
                                      MyText(
                                        text: item["due"],
                                        size: 12,
                                        fontFamily: AppFonts.gilroyMedium,
                                        paddingBottom: 8,
                                      ),
                                      linearProgressIndicatorr(
                                        value:
                                            (item["percentage"] as int) / 100,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ])),
                          CustomeContainer(
            radius: 10,
            borderColor: kblueBorder3,
            color: kblackfill,
            vpad: 17,
            hpad: 13,
            mbott: 20,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: row_widget(
                        title: 'Active Tasks',
                        fontFamily: AppFonts.gilroyBold,
                        texSize: 12,
                        icon: Assets.imagesMock,
                        iconSize: 15,
                      ),
                    ),
                    buttonContainer(
                      radius: 4,
                      vPadding: 3,
                      hPadding: 8,
                      text: 'Add Task',
                      borderColor: kblueBorder2,
                      bgColor: kblackfill,
                      icon: Icons.add_rounded,
                      iconColor: ksecondary,
                      textsize: 11,
                    )
                  ],
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: savedQuizzes.length,
                  itemBuilder: (context, index) {
                    final quiz = savedQuizzes[index];
                    return test_competency_widget(
                      text1: quiz['title'],
                      text2: quiz['time'],
                      hasButton: false,
                    );
                  },
                ),
              ],
            ),
          ),

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
                              onTap: () {
                                Get.to(()=>AiPlanningAssistant());
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
