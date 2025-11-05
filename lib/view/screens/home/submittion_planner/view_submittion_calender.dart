import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/cpd_tracker.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/add_new_submission_items.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/calender_dialog.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewSubmittionCalender extends StatelessWidget {
  const ViewSubmittionCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          bgColor: ktransparent,
                          text: 'Add Items',
                          textsize: 14,
                          borderColor: getSecondaryColor(context),
                          txtColor: getSecondaryColor(context),
                          vPadding: 13,
                          weight: FontWeight.w500,
                          fontFamily: AppFonts.gilroyRegular,
                          icon: Icons.add_rounded,
                          iconColor: getSecondaryColor(context),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: CustomDropDown(
                              mBottom: 0,
                              bordercolor: getSecondaryColor(context),
                              hintsize: 14,
                              hintColor: getSecondaryColor(context),
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
                              value: 'All Categories',
                              bgColor: ktransparent,
                              iconColor: getSecondaryColor(context),
                              onChanged: (e) {}))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomCalendarSheet(),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      row_widget(
                        title: 'Completed',
                        customWidget: CircleAvatar(
                          radius: 5,
                          backgroundColor: kgreen,
                        ),
                        textColor: getTertiary(context),
                        texSize: 12,
                        fontFamily: AppFonts.gilroyMedium,
                      ),
                      row_widget(
                        title: 'Due Soon',
                        customWidget: CircleAvatar(
                          radius: 5,
                          backgroundColor: kyellow,
                        ),
                        textColor: getTertiary(context),
                        texSize: 12,
                        fontFamily: AppFonts.gilroyMedium,
                      ),
                      row_widget(
                        title: 'Overdue',
                        customWidget: CircleAvatar(
                          radius: 5,
                          backgroundColor: kred2,
                        ),
                        textColor: getTertiary(context),
                        texSize: 12,
                        fontFamily: AppFonts.gilroyMedium,
                      )
                    ],
                  ),
                  MyText(
                    text: "Today's Submissions",
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingTop: 15,
                    paddingBottom: 15,
                  ),
                  _event_container(),
                  MyText(
                    text: "Upcoming Deadlines",
                    size: 14,
                    fontFamily: AppFonts.gilroyBold,
                    paddingTop: 15,
                    paddingBottom: 15,
                  ),
                  _event_container(
                    upcoming: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  _event_container(
                    upcoming: true
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class _event_container extends StatelessWidget {
  final String? text1, text2, priority, progress;
  final bool? upcoming;
  const _event_container({
    super.key,
    this.text1,
    this.text2,
    this.priority,
    this.progress,
    this.upcoming = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      borderColor: getfifth(context),
      vpad: 17,
      hpad: 17,
      color: getfillcolor(context),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          recnet_activity_widget(
            buttonText: priority ?? 'High',
            text1: text1 ?? 'Research Portfolio Review',
            text2: text2 ?? 'Due today at 11:59 PM',
            statusBgColor: kred2.withOpacity(0.2),
            statusTextColor: kred2,
            statusVpad: 4,
            size1: 12,
            fontFamily1: AppFonts.gilroyBold,
          ),
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: "Progress: ${progress ?? '45%'}",
                  size: 12,
                  fontFamily: AppFonts.gilroyBold,
                ),
              ),
              if (upcoming == false)
                buttonContainer(
                  bgColor: ktransparent,
                  borderColor: getSecondaryColor(context),
                  radius: 6,
                  txtColor: getSecondaryColor(context),
                  vPadding: 5,
                  text: 'Continue',
                ),
              if (upcoming == true)
                row_widget(
                  icon: Assets.imagesClock,
                  texSize: 12,
                  iconSize: 15,
                  iconColor: getTertiary(context),
                  textColor: getTertiary(context),
                  title: '6h remaining',
                  fontFamily: AppFonts.gilroyMedium,
                )
            ],
          ),
        ],
      ),
    );
  }
}
