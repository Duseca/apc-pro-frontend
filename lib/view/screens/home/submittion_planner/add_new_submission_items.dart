import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/submittion_planner/log_diary_dialog.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
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
        borderColor: getfifth(context),
        bgColor: getfillcolor(context),
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
                      Image.asset(Assets.imagesCross,
                          width: 15, color: getSecondaryColor(context))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField2(
                    label: 'Title',
                    hint: 'Enter title',
                    filledColor: getfifth(context),
                    bordercolor: ktransparent,
                  ),
                  CustomDropDown(
                    hint: 'Select category',
                    items: [
                      'Category 1',
                      'Category 2',
                      'Category',
                      'Select category'
                    ],
                    value: 'Select category',
                    onChanged: (i) {},
                    label: 'Category',
                    //hasInfo: false,
                    iconColor: getSecondaryColor(context),
                    bgColor: getfifth(context),
                  ),
                        MyText(
                    text: 'Priority',
                    size: 14,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buttonContainer(
                        radius: 8,
                        borderColor: getSecondaryColor(context),
                        text: 'LOW',
                        vPadding: 5,
                        bgColor: ktransparent,
                      ),
                      buttonContainer(
                        radius: 8,
                        borderColor: getSecondaryColor(context),
                        text: 'MEDIUM',
                        vPadding: 5,
                        bgColor: ktransparent,
                      ),
                      buttonContainer(
                        radius: 8,
                        borderColor: getSecondaryColor(context),
                        text: 'HIGH',
                        vPadding: 5,
                        bgColor: ktransparent,
                      ),
                      buttonContainer(
                        radius: 8,
                        borderColor: getSecondaryColor(context),
                        text: 'CRITICAL',
                        vPadding: 5,
                        bgColor: ktransparent,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField2(
                    label: 'Due Date',
                    hint: 'mm/dd/yyyy',
                    suffixIcon: Image.asset(
                      Assets.imagesCalendar,
                      width: 18,
                      color: getSecondaryColor(context),
                    ),
                    filledColor: getfifth(context),
                    bordercolor: ktransparent,
                  ),
                  MyText(
                    text: 'Estimated Time',
                    size: 14,
                    fontFamily: AppFonts.gilroySemiBold,
                    paddingBottom: 8,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        flex: 4,
                        child: MyTextField2(
                          hint: 'Enter estimated time',
                          filledColor: getfifth(context),
                          bordercolor: ktransparent,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomDropDown(
                          hint: 'Hours',
                          items: [
                            'Hours',
                            'Minutes',
                          ],
                          value: 'Hours',
                          onChanged: (i) {},

                          //hasInfo: false,
                          iconColor: getSecondaryColor(context),
                          bgColor: getfifth(context),
                        ),
                      ),
                    ],
                  ),
                  MyTextField2(
                    label: 'Description',
                    hint:
                        'Write your notes, reflections, or progress details here.',
                    filledColor: getfifth(context),
                    bordercolor: ktransparent,
                    maxLines: 4,
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
                  SizedBox(height: 20,),
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
                  Get.dialog(LogDiaryDialog());
                },
              )),
              Expanded(
                  child: MyButton(
                backgroundColor: getfillcolor(context),
                fontColor: getSecondaryColor(context),
                outlineColor: getSecondaryColor(context),
                buttonText: 'Cancel',
                height: 48,
                fontSize: 12,
                onTap: () {
                  Get.back();
                },
              )),
          
            ],
          )
                ],
              ),
            ),
          ],
        ));
  }
}
