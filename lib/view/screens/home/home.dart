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
import 'package:apc_pro/view/screens/news/news.dart';
import 'package:apc_pro/view/screens/notifications/notifications.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/home_widgets.dart';
import 'package:apc_pro/view/widgets/jobs_widgets/jobs_cards.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    RxBool isRics = false.obs;

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

    // RICS-specific list
    final List<Map<String, dynamic>> ricsOptions = [
      {
        "icon": Assets.imagesCpdtracker,
        "text": "CPD Tracker",
        "onTap": () {
          Get.to(() => CpdTracker());
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
        "icon": Assets.imagesSummary,
        "text": "News",
        "onTap": () {
          Get.to(() => News());
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
          color: getSecondaryColor(context),
        ),
        hasNonTextedTitle: true,
        centerTitle: true,
        actions: [
          Bounce(
            onTap: () {
                 Get.to(() => Notificationss());
            },
            child: Image.asset(
              Assets.imagesBellIcon,
              width: 22,
              color: getSecondaryColor(context),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  // Greeting Row
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
                              text: isRics.value
                                  ? 'RICS Qualified\nQuantity Surveying and Construction'
                                  : 'APC Candidate\nQuantity Surveying and Construction',
                              color: getTertiary(context),
                              paddingLeft: 8,
                              lineHeight: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Daily Update Button
                  Row(
                    children: [
                      Image.asset(
                        Assets.imagesLogo1,
                        width: 44,
                        height: 44,
                      ),
                      const SizedBox(width: 20),
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
                  const SizedBox(height: 24),

                  // Progress Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circular_indicator_stack(
                        title: isRics.value ? 'Annual CPD Completion' : 'Diary',
                      ),
                      circular_indicator_stack(
                        title: isRics.value ? 'Average Test Score' : 'CPD',
                      ),
                      circular_indicator_stack(
                        title:
                            isRics.value ? 'Competency Coverage' : 'Case Study',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

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
                                text1: isRics.value
                                    ? "Review Annual Performance"
                                    : "Complete Today's Diary Entry",
                                text2: isRics.value
                                    ? "Check your yearly performance progress and completion status."
                                    : "Don’t forget to fill in your diary before the day ends.",
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        row_widget(
                          title: 'View Now',
                          iconData: Icons.keyboard_arrow_right_rounded,
                          isIconRight: true,
                          decor: TextDecoration.underline,
                          onTap: () {
                            isRics.value = !isRics.value;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Grid Menu
                  GridView.builder(
                    itemCount:
                        isRics.value ? ricsOptions.length : homeOptions.length,
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
                      final list = isRics.value ? ricsOptions : homeOptions;
                      final item = list[index];
                      return home_opts_container(
                        text: item["text"],
                        icon: item["icon"],
                        ontap: item["onTap"],
                      );
                    },
                  ),
                  if (isRics.value) ...{
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
                  },
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: ExpandedRow(
                          text1: 'Top Stories',
                          text2: 'See all',
                          size1: 16,
                          fontFamily: AppFonts.gilroyBold,
                          size2: 14,
                          fontFamily2: AppFonts.gilroyMedium,
                          color2: getTertiary(context),
                        ),
                      ),
                      Image.asset(
                        Assets.imagesForward,
                        width: 15,
                        color: getTertiary(context),
                      )
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: news_feed_card());
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ExpandedRow(
                          text1: 'Featured Jobs',
                          text2: 'See all',
                          size1: 16,
                          fontFamily: AppFonts.gilroyBold,
                          size2: 14,
                          fontFamily2: AppFonts.gilroyMedium,
                          color2: getTertiary(context),
                        ),
                      ),
                      Image.asset(
                        Assets.imagesForward,
                        width: 15,
                        color: getTertiary(context),
                      )
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: jobs_container(
                          hasIcon: true,
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ExpandedRow(
                          text1: 'Upcoming CPD',
                          text2: 'See all',
                          size1: 16,
                          fontFamily: AppFonts.gilroyBold,
                          size2: 14,
                          fontFamily2: AppFonts.gilroyMedium,
                          color2: getTertiary(context),
                        ),
                      ),
                      Image.asset(
                        Assets.imagesForward,
                        width: 15,
                        color: getTertiary(context),
                      )
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: jobs_container(
                          hasIcon: true,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
