import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/Navbar/bottom_navbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewProfile extends StatelessWidget {
  const ReviewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<SurveyController>();

    List<Map<String, dynamic>> career = [
      {
        'title': 'Personal Information',
        'detail1': 'Sarah John',
        'detail2': 'SarahJohn@gmail.com',
      },
      {
        'title': 'Pathway & Location',
        'detail1': 'Quantity Surveying and Construction',
        'detail2': 'England, United Kingdom',
      },
      {
        'title': 'Career Details',
        'detail1': 'APC Candidate',
        'detail2': '',
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomeContainer(
            color: getfillcolor(context),
            vpad: 14,
            hpad: 10,
            radius: 8,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpandedRow(
                  text1: 'Profile Completion',
                  text2: '95%',
                  size1: 14,
                  size2: 14,
                  fontFamily2: AppFonts.gilroyMedium,
                  fontFamily: AppFonts.gilroyBold,
                  color1: getSecondaryColor(context),
                  color2: getSecondaryColor(context),
                ),
                SizedBox(height: 16,)
,                linearProgressIndicatorr(
                  

                ),
SizedBox(
  height: 16,
),
                row_widget(
                  icon: Assets.imagesProfilecheck,
                  iconSize: 16,
                  iconColor: isDarkMode?kwhite:null,
                  title: 'Strong profile - Ready to complete',
                  textColor: getTertiary(context),
                )
              ],
            )),
        CustomeContainer(
          mtop: 15,
          color: getfillcolor(context),
          vpad: 14,
          hpad: 10,
          radius: 8,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: career.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: career[index]['title'],
                          size: 14,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 8,
                        ),
                        MyText(
                          text: career[index]['detail1'],
                          size: 14,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 3,
                          color: getTertiary(context),
                        ),
                        MyText(
                          text: career[index]['detail2'],
                          size: 12,
                          weight: FontWeight.w400,
                          color: getTertiary(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
              MyText(
                text: 'Selected Competencies',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 8,
              ),
              MyText(
                text: 'Technical Core',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                color: getTertiary(context),
                paddingBottom: 2,
              ),
              MyText(
                text: 'Chosen Option 1\nChosen Option 2\nChosen Option 3',
                color: getTertiary(context),
                size: 14,
              ),
              MyText(
                paddingTop: 10,
                text: 'Technical Optional',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                color: getTertiary(context),
                paddingBottom: 2,
              ),
              MyText(
                text: 'Chosen Option 1\nChosen Option 2\nChosen Option 3',
                color: getTertiary(context),
                size: 14,
              ),
              MyText(
                paddingTop: 10,
                text: 'CPD Status',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 8,
              ),
              MyText(
                text: '6 hours completed',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                color: getTertiary(context),
                paddingBottom: 2,
              ),
              MyText(
                text: 'Target: 20 hours',
                color: getTertiary(context),
                size: 12,
              ),
              MyText(
                paddingTop: 10,
                text: 'Estimated Final Assessment Date',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 8,
              ),
              MyText(
                text: '01/11/2026',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                color: getTertiary(context),
                paddingBottom: 2,
              ),
            ],
          ),
        ),
        CustomeContainer(
          mtop: 20,
          mbott: 20,
          color: getfillcolor(context),
          vpad: 14,
          hpad: 10,
          radius: 8,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                paddingTop: 5,
                text: 'Final Steps',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 12,
              ),
              _buildCheckboxRow(
                  "I agree to the Terms and Conditions",
                  "By checking this box, I acknowledge that I have read and agree to the platform’s terms of service",
                  context),
              const SizedBox(height: 14),
              _buildCheckboxRow("Privacy Policy Acknowledgment",
                  "I understand how my data will be used and stored", context),
              const SizedBox(height: 14),
              _buildCheckboxRow(
                  "Email Notifications",
                  "Receive updates about learning opportunities and platform features",
                  context),
              CustomeContainer(
                mtop: 15,
                mbott: 10,
                color: getsplashcolor(context),
                vpad: 14,
                hpad: 10,
                radius: 8,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Profile Visibility",
                      size: 16,
                      weight: FontWeight.w600,
                      color: getSecondaryColor(context),
                      paddingBottom: 12,
                    ),
                    _buildCheckboxRow(
                        "Public", "Visible to all platform members", context,
                        isCircle: true),
                    _buildCheckboxRow(
                        "Connections Only",
                        "Only visible to your professional connections",
                        context,
                        isCircle: true),
                    _buildCheckboxRow(
                        "Private", "Not visible to other members", context,
                        isCircle: true)
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Bounce(
                onTap: () {
                  controller.previousStep();
                },
                child: Image.asset(
                  isDarkMode
                      ? Assets.imagesBackbutton
                      : Assets.imagesBackbutton2,
                  width: 48,
                  height: 45,
                )),
            MyText(
              paddingLeft: 10,
              paddingRight: 10,
              text: 'Save as Draft',
              size: 14,
              fontFamily: AppFonts.gilroyMedium,
              onTap: () {},
            ),
            Expanded(
              child: MyButton(
                backgroundColor: getSecondaryColor(context).withOpacity(0.1),
                buttonText: 'Continue',
                fontColor: getTertiary(context),
                onTap: () {
                 Get.to(BottomNavBar());
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCheckboxRow(
    String title,
    String subtitle,
    BuildContext context, {
    bool? isCircle,
  }) {
    return CustomeContainer(
      color: getsplashcolor(context),
      vpad: 10,
      hpad: 10,
      radius: 8,
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckBox(
            isActive: false,
            onTap: () {},
            selectedColor: getSecondaryColor(context),
            unSelectedColor: Colors.transparent,
            borderColor: getSecondaryColor(context),
            size: 20,
            radius: 4,
            iscircle: isCircle,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TwoTextedColumn(
              text1: title,
              text2: subtitle,
              color1: getSecondaryColor(context),
              color2: getTertiary(context),
              weight1: FontWeight.w600,
              weight2: FontWeight.w400,
              size1: 14,
              size2: 13,
              lineHeight: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
