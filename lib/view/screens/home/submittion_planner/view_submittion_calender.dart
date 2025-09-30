import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/add_new_submission_items.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/calender_dialog.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewSubmittionCalender extends StatelessWidget {
  const ViewSubmittionCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackground,
        appBar: simpleAppBar(
            context: context, title: 'Submission Calendar', centerTitle: true),
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
                  Row(
                    spacing: 18,
                    children: [
                      Expanded(
                        flex: 2,
                        child: buttonContainer(
                          onTap: () {
                            Get.dialog(AddNewSubmissionItems());
                          },
                          radius: 8,
                          bgColor: kbackground,
                          text: 'Add Items',
                          textsize: 14,
                          borderColor: kblueBorder4,
                          txtColor: Color(0xff94BFFF),
                          vPadding: 13,
                          weight: FontWeight.w500,
                          fontFamily: AppFonts.gilroyRegular,
                          icon: Icons.add_rounded,
                          iconColor: Color(0xff94BFFF),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: CustomDropDown(
                              mBottom: 0,
                              bordercolor: kblueBorder4,
                              hintsize: 14,
                              hintColor: Color(0xff94BFFF),
                              hint: 'All Categories',
                              items: [
                                'All Categories',
                                'Diary',
                                'Summary',
                                'Case Study',
                                'CPD',
                                'Mock Interview',
                                'Submission'
                              ],
                              selectedValue: 'All Categories',
                              iconColor: Color(0xff94BFFF),
                              onChanged: (e) {}))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomCalendarSheet()
                ],
              ),
            ),
          ],
        ));
  }
}
