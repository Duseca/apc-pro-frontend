import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/log_diary_dialog.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/range_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewSubmissionItems extends StatelessWidget {
  final String? title;
  final VoidCallback? ontap;
  const AddNewSubmissionItems({super.key, this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return dialogBoxBody(
        borderColor: kblueBorder3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: MyText(
                        text: title ?? 'Add New Entry',
                        size: 18,
                        fontFamily: AppFonts.gilroyBold,
                      )),
                      Image.asset(
                        Assets.imagesCross,
                        width: 15,
                        color: kwhite,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    label: 'Title',
                    hint: 'Enter title',
                    marginBottom: 25,
                  ),
                  SimpleDropDown(
                    hint: '',
                    items: ['Category 1', 'Category 2', 'Category', ''],
                    value: '',
                    onChanged: (i) {},
                    label: 'Category',
                    hasInfo: false,
                    iconColor: klighblue,
                    backgroundColor: kbackground,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SimpleDropDown(
                    hint: '',
                    items: ['Priority 1', 'Priority 2', 'Priority', ''],
                    value: '',
                    onChanged: (i) {},
                    label: 'Priority',
                    hasInfo: false,
                    iconColor: klighblue,
                    backgroundColor: kbackground,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    label: 'Due Date',
                    hint: '',
                    suffixIcon: Image.asset(
                      Assets.imagesCalendar,
                      width: 18,
                      color: klighblue,
                    ),
                    marginBottom: 25,
                  ),
                  SimpleDropDown(
                    hint: '', //'Status',
                    items: ['Status 1', 'Status 2', 'Status', ''],
                    value: '',
                    onChanged: (i) {},
                    label: 'Status',
                    hasInfo: false,
                    backgroundColor: kbackground,
                    iconColor: klighblue,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    label: 'Estimated Time',
                    hint: 'Enter estimated time',
                  ),
                  MyTextField(
                    label: 'Description',
                    hint:
                        'Write your notes, reflections, or progress details here.',
                    marginBottom: 25,
                  ),
                  MyText(
                    text: 'Progress',
                    fontFamily: AppFonts.gilroyMedium,
                    paddingBottom: 10,
                  ),
                  QuestionSilder(
                    i2: '',
                    i1: '0%',
                    i3: '100%',
                  ),
                  MyButton(
                    buttonText: 'Save',
                    mTop: 20,
                    onTap: ontap ??
                        () {
                          Get.back();
                          Get.dialog(LogDiaryDialog());
                        },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
