import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/controllers/survey_controller.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PathwayLocation extends StatelessWidget {
  const PathwayLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> pathways = [
      'Arts & Antiques',
      'Building Control',
      'Building Surveying',
      'Commercial Real Estate',
      'Corporate Real Estate',
      'Environmental Surveying',
      'Facilities Management',
      'Geomatics',
      'Infrastructure',
      'Land & Resources',
      'Land & Resources – Minerals & Waste',
      'Management Consultancy',
      'Management & Consultancy – Project Management',
      'Marine Surveying',
      'Personal Property & Machinery',
      'Planning & Development',
      'Property Finance & Investment',
      'Property Management',
      'Residential Property',
      'Rural',
      'Valuation',
      'Quantity Surveying & Construction (Your default pathway)'
    ];
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<SurveyController>();
    String selectedPathway = 'Building Surveying';

    return Column(
      children: [
        CustomDropDown(
          label: "RICS Pathway",
          hint: "Select your RICS pathway",
          items: pathways,
          onChanged: (val) {
            selectedPathway = val!;
          },
          value: selectedPathway,
          mBottom: 5,
        ),
        MyText(
          text:
              'Choose the pathway that best matches your professional focus and career goals',
          size: 12,
          color: getTertiary(context),
          paddingBottom: 15,
        ),
        CustomDropDown(
          label: "Region",
          hint: "Select your region",
          items: ["Region 1", "Region 2", "Region 3", "Select your region"],
          value: 'Select your region',
          onChanged: (val) {},
        ),
        CustomDropDown(
          label: "Country",
          hint: "Select your country",
          items: ["Country 1", "Country 2", "Country 3", "Select your country"],
          value: "Select your country",
          onChanged: (val) {},
          // hasInfo: true,
        ),
        CustomeContainer(
          mtop: 15,
          color: getfillcolor(context).withOpacity(0.5),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.imagesCircle,
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Location-Based Opportunities',
                          size: 14,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 5,
                        ),
                        MyText(
                          text:
                              'Your location helps us show relevant job opportunities, networking events, and local industry connections in your area.\n\nMany RICS pathways have international recognition, opening global career opportunities.',
                          size: 12,
                          color: getTertiary(context),
                          paddingBottom: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // row_widget(
              //   title: 'Read full privacy policy',
              //   lpad: 0,
              //   texSize: 12,
              //   icon: Assets.imagesArrow,
              //   iconSize: 12,
              //   isIconRight: true,
              // )
            ],
          ),
          mbott: 15,
        ),
        SizedBox(
          height: 25,
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
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: MyButton(
                backgroundColor: getSecondaryColor(context).withOpacity(0.1),
                buttonText: 'Continue',
                fontColor: getTertiary(context),
                onTap: () {
                  controller.nextStep();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
