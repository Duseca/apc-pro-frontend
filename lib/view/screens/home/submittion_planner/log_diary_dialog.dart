import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/add_new_submission_items.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogDiaryDialog extends StatelessWidget {
  const LogDiaryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return dialogBoxBody(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          Row(
            children: [
              Expanded(
                  child: MyText(
                text: 'Log weekly diary entries',
                size: 18,
                fontFamily: AppFonts.gilroyBold,
              )),
              Image.asset(
                Assets.imagesCross,
                width: 15,
                color: getSecondaryColor(context),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonContainer(
                onTap: () {
                  //Get.dialog(AddNewSubmissionItems());
                },
                radius: 4,
                bgColor: ktransparent,
                text: 'Task',
                textsize: 14,
                borderColor: getfifth(context),
                txtColor: getSecondaryColor(context),
                vPadding: 3,
                weight: FontWeight.w500,
                fontFamily: AppFonts.gilroyMedium,
              ),
              buttonContainer(
                onTap: () {
                  //Get.dialog(AddNewSubmissionItems());
                },
                radius: 4,
                bgColor: ktransparent,
                text: 'High Priority',
                textsize: 14,
                borderColor: getfifth(context),
                txtColor: getSecondaryColor(context),
                vPadding: 3,
                weight: FontWeight.w500,
                fontFamily: AppFonts.gilroyMedium,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ExpandedRow(
            text1: 'Due Date:',
            text2: 'Thursday 28 Aug 2025',
            size1: 11,
            size2: 11,
            fontFamily: AppFonts.gilroyMedium,
            fontFamily2: AppFonts.gilroyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          ExpandedRow(
            text1: 'Status:',
            text2: 'In Progress',
            size1: 11,
            size2: 11,
            fontFamily: AppFonts.gilroyMedium,
            fontFamily2: AppFonts.gilroyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          ExpandedRow(
            text1: 'Progress',
            text2: '65 %',
            size1: 11,
            size2: 11,
            fontFamily: AppFonts.gilroyMedium,
            fontFamily2: AppFonts.gilroyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          ExpandedRow(
            text1: 'Estimated Time',
            text2: '2h',
            size1: 11,
            size2: 11,
            fontFamily: AppFonts.gilroyMedium,
            fontFamily2: AppFonts.gilroyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          TwoTextedColumn(
            text1: 'Description',
            text2: 'Maintain Consistency....',
            size1: 12,
            size2: 12,
            fontFamily: AppFonts.gilroyBold,
            fontFamily2: AppFonts.gilroyRegular,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                  child: MyButton(
                buttonText: 'Save',
                height: 48,
                fontSize: 12,
                fontColor: getSecondaryColor(context),
                backgroundColor: getfifth(context),
                onTap: () {
                  Get.back();
                },
              )),
              Expanded(
                  child: MyButton(
                backgroundColor: getfillcolor(context),
                fontColor: getSecondaryColor(context),
                outlineColor: getSecondaryColor(context),
                buttonText: 'Edit',
                height: 48,
                fontSize: 12,
                onTap: () {
                  Get.dialog(AddNewSubmissionItems(
                    title: 'Log weekly diary entries',
                    ontap: () {
                      Get.back();
                    },
                  ));
                },
              )),
            ],
          ),
        ]));
  }
}
