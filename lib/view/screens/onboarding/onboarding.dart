import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/auth/login/login.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
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
      "title": "Welcome to APC Pro",
      "desc":
          "Your comprehensive companion designed to guide you through every step of the RICS APC journey. Gain clarity, build confidence, and master your pathway with personalised support tailored just for you.",
    },
    {
      "image": Assets.imagesOnboarding2,
      "title": "Key Features of APC Pro",
      "desc": "", // handled separately below
    },
    {
      "image": Assets.imagesOnboarding3,
      "title": "Lets Get Started",
      "desc":
          "Complete a quick onboarding survey to personalise your APC Pro experience. We'll tailor content, study plans, and reminders based on your pathway, goals, and current progress. Start your journey towards chartered success with confidence and clarity.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: List.generate(onboardingData.length, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(4),
                        backgroundColor: kgrey,
                        valueColor: AlwaysStoppedAnimation<Color>(ksecondary),
                        value: index < currentIndex
                            ? 1
                            : (index == currentIndex ? 1 : 0),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: MyText(
                paddingTop: 20,
                text: 'Skip',
                size: 16,
                decoration: TextDecoration.underline,
                color: kwhite,
                paddingRight: 20,
                textAlign: TextAlign.right,
              ),
            ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          data["image"]!,
                          height: 250,
                        ),
                        if (index == 1)
                          Column(
                            children: [
                              MyText(
                                text: 'Key Features of APC Pro',
                                size: 30,
                                weight: FontWeight.bold,
                                paddingBottom: 10,
                                textAlign: TextAlign.center,
                              ),
                              TwoTextedColumn(
                                text1: 'AI Coach',
                                text2:
                                    'Smart guidance tailored to your pathway and progress.',
                                size1: 14,
                                size2: 14,
                                align: TextAlign.center,
                                alignment: ColumnAlignment.center,
                                weight1: FontWeight.bold,
                              ),
                              const SizedBox(height: 8),
                              TwoTextedColumn(
                                text1: 'Progress Rings',
                                text2:
                                    'Track diary, CPD, and case study completion at a glance.',
                                size1: 14,
                                size2: 14,
                                align: TextAlign.center,
                                alignment: ColumnAlignment.center,
                                weight1: FontWeight.bold,
                              ),
                              const SizedBox(height: 8),
                              TwoTextedColumn(
                                text1: 'Submission Planner',
                                text2:
                                    'Organise milestones and never miss a deadline.',
                                size1: 14,
                                size2: 14,
                                align: TextAlign.center,
                                alignment: ColumnAlignment.center,
                                weight1: FontWeight.bold,
                              ),
                            ],
                          )
                        else
                          TwoTextedColumn(
                            text1: data["title"]!,
                            text2: data["desc"]!,
                            size1: 28,
                            size2: 16,
                            align: TextAlign.center,
                            alignment: ColumnAlignment.center,
                            weight1: FontWeight.bold,
                          ),
                        Column(
                          children: [
                            SmoothPageIndicator(
                              controller: controller,
                              count: onboardingData.length,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: Colors.white,
                                dotColor: Colors.grey,
                                dotHeight: 8,
                                dotWidth: 8,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Bounce(
                              onTap: () {
                                if (index == onboardingData.length - 1) {
                                  Get.to(() => const Login());
                                } else {
                                  controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Image.asset(
                                Assets.imagesOnboardingButton,
                                width: 64,
                                height: 64,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
