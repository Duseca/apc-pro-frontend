import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.imagesOnboarding1,
      "title": "Welcome to Survyr",
      "desc":
          "Your comprehensive companion designed to guide you through every step of the RICS APC journey. Gain clarity, build confidence, and master your pathway with personalized support tailored just for you.",
    },
    {
      "image": Assets.imagesOnboarding2,
      "title": "Key Features",
      "desc":
          "Choose your pathway and see progress at a glance with rings for your APC Diary, Case Study and CPD. Log entries fast, track word counts and plan milestones with notifications, then get AI tips that follow RICS guidance to keep you organized and confident.", // handled separately below
    },
    {
      "image": Assets.imagesOnboarding3,
      "title": "Lets Get Started",
      "desc":
          "Complete a quick onboarding survey to personalize your experience. We’ll tailor content, study plans, and reminders based on your pathway, goals, and current progress.Start your journey towards chartered success with confidence and clarity.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: simpleAppBar(
          context: context,
          hasNonTextedTitle: true,
          haveBackButton: false,
          centerTitle: true,
          title2: Image.asset(
            Assets.imagesLogo,
            width: 120,
            height: 32,
            color: isDarkMode ? null : kbackground,
          )),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, right: 20, bottom: 40),
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        data["image"]!,
                        height: 286,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      MyText(
                        text: data["title"]!,
                        size: 16,
                        fontFamily: AppFonts.gilroyBold,
                        textAlign: TextAlign.center,
                        paddingBottom: 5,
                        color: getSecondaryColor(context),
                      ),
                      MyText(
                        text: data["desc"]!,
                        size: 14,
                        color: getSecondaryColor(context),
                        lineHeight: 1.5,
                      ),
                      const SizedBox(height: 32),
                      SmoothPageIndicator(
                        controller: controller,
                        count: onboardingData.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: getSecondaryColor(context),
                          dotColor: getSecondaryColor(context),
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          MyText(
            paddingTop: 20,
            text: 'Skip',
            size: 14,
            color: getSecondaryColor(context),
            fontFamily: AppFonts.gilroyBold,
            textAlign: TextAlign.center,
            paddingBottom: 20,
          ),
          MyButton(
            onTap: () {
              if (currentIndex == onboardingData.length - 1) {
                Get.to(() => const Login());
              } else {
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            height: 44,
            mhoriz: 20,
            buttonText: 'Next',
            fontColor: getSecondaryColor(context),
            outlineColor: getSecondaryColor(context),
            backgroundColor: getfillcolor(context),
            mBottom: 50,
            fontSize: 14,
          )
        ],
      ),
    );
  }
}
