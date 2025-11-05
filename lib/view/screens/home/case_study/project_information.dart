import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/case_study/confidential.dart';
import 'package:apc_pro/view/screens/home/case_study/project_details.dart';
import 'package:apc_pro/view/screens/home/case_study/team_client.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectInformation extends StatelessWidget {
  const ProjectInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      "Basic Info",
      'Project Details',
      'Team & Client',
      'Confidential'
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Project Information', centerTitle: true),
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
                    vpad: 17,
                    hpad: 17,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Assets.imagesDocument,
                              color: getSecondaryColor(context),
                              width: 16,
                            ),
                            Expanded(
                              child: MyText(
                                text: 'Project Information',
                                size: 14,
                                fontFamily: AppFonts.gilroyBold,
                                paddingLeft: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ExpandedRow(
                          text1: 'Section Complete',
                          text2: '1/4',
                          size1: 14,
                          size2: 14,
                          color2: getTertiary(context),
                        ),
                        SizedBox(height: 8,),
                        linearProgressIndicatorr(
                          height: 6,
                          bgColor: getfifth(context),
                        ),
                        MyText(
                          paddingTop: 8,
                          text: '25% Complete',
                          size: 12,
                          fontFamily: AppFonts.gilroyRegular,
                          color: getTertiary(context),
                          paddingBottom: 15,
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            row_widget(
                                icon: Assets.imagesError,
                                title: '4 errors',
                                iconSize: 12,
                                texSize: 14,
                                fontFamily: AppFonts.gilroyMedium,
                                textColor: getTertiary(context)),
                            row_widget(
                                icon: Assets.imagesWarning,
                                title: '1 warning',
                                iconSize: 12,
                                fontFamily: AppFonts.gilroyMedium,
                                texSize: 14,
                                textColor: getTertiary(context)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    mbott: 20,
                  ),
                  Obx(
                    () => TabsWidget(
                      bgColor: getfillcolor(context),
                      items: tabs,
                      currentindex: currentIndex.value,
                      ontap: (p0) {
                        currentIndex.value = p0;
                      },
                      isexpanded: true,
                      textSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(() {
                    switch (currentIndex.value) {
                      case 0:
                        return BasicInfo();
                      case 1:
                        return ProjectDetails();
                      case 2:
                        return TeamClient();
                      case 3:
                        return Confidential();
                      default:
                        return BasicInfo();
                    }
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      color: getfillcolor(context),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField2(
            label: 'Project Title *',
            hint: 'e.g., Commercial Office...... ',
            marginBottom: 20,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Start date *',
            hint: 'mm/dd/yyyy',
            suffixIcon: Image.asset(
              Assets.imagesCalendar,
              width: 20,
              color: getSecondaryColor(context),
            ),
            marginBottom: 20,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'End date *',
            hint: 'mm/dd/yyyy',
            suffixIcon: Image.asset(
              Assets.imagesCalendar,
              width: 20,
              color: getSecondaryColor(context),
            ),
            marginBottom: 20,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Project Sector',
            hint: 'Other....',
            marginBottom: 20,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Project Location',
            hint: 'Other....',
            marginBottom: 20,
            filledColor: getfifth(context),
          ),
          MyText(
            text: 'Project Value',
            size: 14,
            fontFamily: AppFonts.gilroySemiBold,
            paddingBottom: 11,
          ),
          MyTextField2(
            hint: 'Enter project value',
            label: 'Value',
            filledColor: getfifth(context),
          ),
          CustomDropDown(
              bordercolor: getSecondaryColor(context),
              label: 'Currency',
              hint: '£ GBP',
              items: ['£ GBP', '£ GBP 2'],
              value: '£ GBP',
              bgColor: getfifth(context),
              onChanged: (w) {}),
          CustomDropDown(
              bordercolor: getSecondaryColor(context),
              label: 'Type',
              hint: 'Construction',
              items: ['Construction', 'Construction 2'],
              value: 'Construction',
              bgColor: getfifth(context),
              onChanged: (c) {}),
        ],
      ),
    );
  }
}
