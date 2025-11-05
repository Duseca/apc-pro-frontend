import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/test_quiz/bookmark_quest.dart';
import 'package:apc_pro/view/screens/home/test_quiz/custom_quiz/create_custom_quiz.dart';
import 'package:apc_pro/view/screens/home/test_quiz/quiz_practice.dart';
import 'package:apc_pro/view/screens/home/test_quiz/test_quiz_widget.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/home_widgets/apc_diary_widgets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestQuiz extends StatelessWidget {
  TestQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    /// Data Lists

    final weakAreas = ['Business Planning', 'Teamworking', 'Sustainability'];

    final strongAreas = [
      'Accounting principles and procedures',
      'Ethics, Rules of conduct and professionalism',
    ];

    final savedQuizzes = [
      {'title': 'Weekly practice test', 'time': '10 Aug   16:11   25 min'},
    ];

    /// Quick Start Items
    final List<Map<String, dynamic>> quickStartItems = [
      {
        'title': 'Quick Practice',
        'desc':
            '10 questions  15 mins\nPerfect for daily practice on corecompetencies',
        'icon': Assets.imagesTodo,
        'ontap': () => Get.to(() => QuizPractice()),
      },
      {
        'title': 'Mock Exam',
        'desc':
            '50 questions  90 mins\nFull length exam simulation with comprehensive coverage',
        'icon': Assets.imagesMock,
        'ontap': () => Get.to(() => QuizPractice()),
      },
      {
        'title': 'Adaptive Quiz',
        'desc':
            '20 questions  30 mins\nAI-powered quiz focusing on your weak areas',
        'icon': Assets.imagesQuiz,
        'ontap': () => Get.to(() => QuizPractice()),
      },
    ];

    /// Study Tools
    final List<Map<String, dynamic>> studyTools = [
      {
        'icon': Assets.imagesTodo,
        'title': 'Bookmarked Question',
        'desc': '1 question saved for review',
        'ontap': () => Get.to(() => BookmarkQuest()),
      },
      {
        'icon': Assets.imagesAnalysis,
        'title': 'Performance Analysis',
        'desc': 'Detailed insights and progress tracking',
        'ontap': () => Get.to(() => BookmarkQuest()),
      },
      {
        'icon': Assets.imagesBulb3,
        'title': 'AI Study Assistance',
        'desc': 'Get personalized quiz recommendations',
        'ontap': () => Get.to(() => BookmarkQuest()),
      },
      {
        'icon': Assets.imagesFolder,
        'title': 'Custom Quiz Builder',
        'desc': 'Create tailored practiced tests',
        'ontap': () => Get.to(() => CreateCustomQuiz()),
      },
    ];

    final List<String> _tabs = ["All", 'Mandatory', 'Core', 'Optional'];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
      appBar: simpleAppBar(
        context: context,
        title: 'Test and Quiz',
        centerTitle: true,
        actions: [
          Bounce(
            child: Image.asset(
              Assets.imagesBulb2,
              width: 24,
              color: getSecondaryColor(context),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20),

          /// Performance Overview
          CustomeContainer(
            radius: 8,
            color: getfillcolor(context),
            vpad: 17,
            hpad: 13,
            mbott: 20,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Performance overview',
                  size: 14,
                  fontFamily: AppFonts.gilroyBold,
                  paddingBottom: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    performance_overview(),
                    performance_overview(
                      icon: Assets.imagesMessg,
                      text2: 'Questions\nAnswered',
                    ),
                    performance_overview(
                      text2: '1 Day',
                    ),
                    performance_overview(
                      text2: '+12%\nImprovementRate',
                    ),
                  ],
                )
              ],
            ),
          ),

          /// Quick Start
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Quick Start',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 10,
              ),

              /// Quick Start
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: quickStartItems.length,
                itemBuilder: (context, index) {
                  final item = quickStartItems[index];
                  return newEntry_container(
                    iconSize: 16,
                    iconColor: getSecondaryColor(context),
                    borderColor: getSecondaryColor(context),
                    bgColor: getfillcolor(context),
                    ontap: item['ontap'],
                    title: item['title']!,
                    desc: item['desc']!,
                    icon: item['icon']!,
                    mbott: 25,
                  );
                },
              ),
            ],
          ),

          /// Competency Performance
          MyText(
            text: 'Competency Performance',
            size: 16,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 15,
          ),
          Obx(
            () => TabsWidget(
              height: 43,
              margin: 2,
              bgColor: getfillcolor(context),
              textSize: 11,
              items: _tabs,
              currentindex: currentIndex.value,
              ontap: (p0) {
                currentIndex.value = p0;
              },
            ),
          ),
          CustomeContainer(
            color: getfillcolor(context),
            borderColor: getSecondaryColor(context),
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                row_widget(
                  title: 'Areas for improvement',
                  fontFamily: AppFonts.gilroyBold,
                  texSize: 14,
                  icon: Assets.imagesDanger,
                  iconColor: getSecondaryColor(context),
                  iconSize: 15,
                ),
                SizedBox(height: 15),
                ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: getTertiary(context),
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: weakAreas.length,
                  itemBuilder: (context, index) =>
                      test_competency_widget(text1: weakAreas[index]),
                ),
                SizedBox(height: 10),
                row_widget(
                  title: 'Strong areas',
                  fontFamily: AppFonts.gilroyBold,
                  texSize: 14,
                  icon: Assets.imagesBrain,
                  iconSize: 15,
                ),
                SizedBox(height: 15),
                ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: getTertiary(context),
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: strongAreas.length,
                  itemBuilder: (context, index) =>
                      test_competency_widget(text1: strongAreas[index]),
                ),
              ],
            ),
          ),

          /// Recent Quiz Activity
          CustomeContainer(
            mtop: 24,
            radius: 8,
            borderColor: getSecondaryColor(context),
            color: getfillcolor(context),
            vpad: 17,
            hpad: 13,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                row_widget(
                  title: 'Recent Quiz Activity',
                  fontFamily: AppFonts.gilroyBold,
                  texSize: 14,
                  icon: Assets.imagesQuiz,
                  iconSize: 16,
                  iconColor: getSecondaryColor(context),
                ),
                SizedBox(height: 15),
                test_competency_widget(
                  text1: 'Mandatory Competencies Practice',
                  text2: '10 Aug   16:11   25 min',
                ),
              ],
            ),
          ),

          /// Saved Quizzes
          CustomeContainer(
            mtop: 24,
            radius: 8,
            borderColor: getSecondaryColor(context),
            color: getfillcolor(context),
            vpad: 17,
            hpad: 13,
            mbott: 24,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: row_widget(
                        title: 'Saved Quizzes',
                        fontFamily: AppFonts.gilroyBold,
                        texSize: 14,
                        icon: Assets.imagesMock,
                        iconSize: 16,
                        iconColor: getSecondaryColor(context),
                      ),
                    ),
                    buttonContainer(
                      radius: 4,
                      vPadding: 3,
                      hPadding: 8,
                      text: 'Create',
                      borderColor: getSecondaryColor(context),
                      bgColor: getfillcolor(context),
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
                      text3: 'Avg',
                    );
                  },
                ),
              ],
            ),
          ),

          /// Study Tools
          CustomeContainer(
            radius: 8,
            borderColor: getSecondaryColor(context),
            color: getfillcolor(context),
            vpad: 17,
            hpad: 13,
            mbott: 24,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                row_widget(
                  title: 'Study Tools',
                  fontFamily: AppFonts.gilroyBold,
                  texSize: 14,
                  icon: Assets.imagesStudytool,
                  iconSize: 16,
                  iconColor: getSecondaryColor(context),
                ),
                SizedBox(height: 20),

                /// Study Tools
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: studyTools.length,
                  itemBuilder: (context, index) {
                    final tool = studyTools[index];
                    return study_tools_widget(
                      icon: tool['icon']!,
                      title: tool['title']!,
                      desc: tool['desc']!,
                      ontap: tool['ontap'],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
