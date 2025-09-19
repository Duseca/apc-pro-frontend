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
    final List<String> _tabs = [
      "Basic Info",
      'Project Details',
      'Team & Client',
      'Confidential'
    ];

    final RxInt currentIndex = 0.obs;
    return Scaffold(
        backgroundColor: kbackground,
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
                    color: kblackfill,
                    vpad: 17,
                    hpad: 17,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Completion',
                          size: 14,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 14,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                text: '25%',
                                size: 12,
                                fontFamily: AppFonts.gilroyRegular,
                              ),
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: linearProgressIndicatorr(
                                    value: 0,
                                  ),
                                ),
                                row_widget(
                                    icon: Assets.imagesDanger,
                                    title: '4 errors',
                                    iconSize: 15,
                                    texSize: 12,
                                    fontFamily: AppFonts.gilroyMedium,
                                    textColor: Color(0xff4285F4)),
                                row_widget(
                                    icon: Assets.imagesDanger,
                                    title: '1 warning',
                                    iconSize: 15,
                                    fontFamily: AppFonts.gilroyMedium,
                                    texSize: 12,
                                    textColor: Color(0xff4285F4)),
                              ],
                            )
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
                      items: _tabs,
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
    return Column(
      crossAxisAlignment: 
      CrossAxisAlignment.start,
      children: [
        MyTextField(
          label: 'Project Title *',
          hint: 'e.g., Commercial Office...... ',
          marginBottom: 20,
        ),
        Row(
          spacing: 15,
          children: [
            Expanded(
              child: MyTextField(
                label: 'Start date *',
                hint: 'mm/dd/yyyy',
                suffixIcon: Image.asset(
                  Assets.imagesCalendar,
                  width: 20,
                ),
                marginBottom: 20,
              ),
            ),
            Expanded(
              child: MyTextField(
                label: 'End date *',
                hint: 'mm/dd/yyyy',
                suffixIcon: Image.asset(
                  Assets.imagesCalendar,
                  width: 20,
                ),
                marginBottom: 20,
              ),
            ),
          ],
        ),
        MyTextField(
          label: 'Project Sector',
          hint: 'Other....',
          marginBottom: 20,
        ),
        MyTextField(
          label: 'Project Location',
          hint: 'Other....',
          marginBottom: 20,
        ),
        MyText(
          text: 'Project Value (Optional)',
          size: 14,
          fontFamily: AppFonts.gilroyRegular,
          paddingLeft: 8,
          paddingBottom: 11,
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
                child: CustomeContainer(
              mbott: 15,
              vpad: 11,
              hpad: 12,
              radius: 7,
              borderColor: kblueBorder,
              widget: Row(
                children: [
                  Expanded(
                      child: MyText(
                    text: 'Value',
                    size: 12,
                    fontFamily: AppFonts.gilroyRegular,
                  )),
                  Column(
                    children: [
                      Image.asset(
                        Assets.imagesArrowup,
                        width: 12,
                      ),
                      Image.asset(
                        Assets.imagesArrowdown,
                        width: 12,
                      )
                    ],
                  )
                ],
              ),
            )),
            Expanded(
                child: CustomDropDown(
                    hint: '£ GBP',
                    items: ['£ GBP', '£ GBP 2'],
                    selectedValue: '£ GBP',
                    onChanged: (w) {})),
            Expanded(
                child: CustomDropDown(
                    hint: 'Construction',
                    items: ['Construction', 'Construction 2'],
                    selectedValue: 'Construction',
                    onChanged: (c) {}))
          ],
        ),
      ],
    );
  }
}
