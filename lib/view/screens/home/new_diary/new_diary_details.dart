import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/stack_hint_container.dart';
import 'package:flutter/material.dart';

class NewDiaryDetails extends StatelessWidget {
  const NewDiaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'New Diary Entry', centerTitle: true),
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropDown(
                    bordercolor: ktransparent,
                    borderColor2: ktransparent,
                    label: "Competency *",
                    hint: "Select competency",
                    items: [
                      "competency 1",
                      "competency 2",
                      "competency 3",
                      'Select competency'
                    ],
                    value: 'Select competency',
                    hintsize: 14,
                    onChanged: (val) {},
                    // onInfoTap: () {},
                    // hasInfo: false,
                  ),
                  CustomDropDown(
                    bordercolor: ktransparent,
                    borderColor2: ktransparent,
                    label: "Competency Level *",
                    hint: "Level 1",
                    items: ["Level 1", "Level 2", "Level 3"],
                    value: 'Level 1',
                    hintsize: 14,
                    onChanged: (val) {},
                  ),
                  MyTextField2(
                    bordercolor: ktransparent,
                    filledColor: getfillcolor(context),
                    hint: 'mm/dd/yyyy',
                    label: 'Start Date *',
                    suffixIcon: Image.asset(
                      Assets.imagesCalendar,
                      width: 18,
                      color: getSecondaryColor(context),
                    ),
                    marginBottom: 20,
                  ),
                  MyText(
                    text: 'Days Committed *',
                    paddingBottom: 8,
                    size: 14,
                    fontFamily: AppFonts.gilroySemiBold,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                          flex: 1,
                          child: MyTextField2(
                            bordercolor: ktransparent,
                            filledColor: getfillcolor(context),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, right: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.minimize_rounded,
                                    color: getSecondaryColor(context),
                                  ),
                                ],
                              ),
                            ),
                            hintSize: 14,
                            align: TextAlign.center,
                            hintColor: getSecondaryColor(context),
                          )),
                      Expanded(
                          flex: 3,
                          child: MyTextField2(
                            bordercolor: ktransparent,
                            filledColor: getfillcolor(context),
                            hint: '1',
                            hintSize: 14,
                            align: TextAlign.center,
                            hintColor: getSecondaryColor(context),
                          )),
                      Expanded(
                          flex: 1,
                          child: MyTextField2(
                            bordercolor: ktransparent,
                            filledColor: getfillcolor(context),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 4, right: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_rounded,
                                    color: getSecondaryColor(context),
                                  ),
                                ],
                              ),
                            ),
                            hintSize: 14,
                            align: TextAlign.center,
                            hintColor: getSecondaryColor(context),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: MyText(
                        text: 'Work Description *',
                        size: 14,
                        fontFamily: AppFonts.gilroySemiBold,
                      )),
                      row_widget(
                        title: '0 words',
                        fontFamily: AppFonts.gilroySemiBold,
                        icon: Assets.imagesBulb2,
                        iconSize: 24,
                        textColor: getTertiary(context),
                        iconColor: getSecondaryColor(context),
                        isIconRight: true,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MyTextField2(
                    bordercolor: ktransparent,
                    filledColor: getfillcolor(context),
                    hint:
                        'Describe the work undertaken, including your specific role, tasks completed, techniques used, and any challenge encountered',
                    maxLines: 4,
                    marginBottom: 20,
                  ),
                  MyTextField2(
                    bordercolor: ktransparent,
                    filledColor: getfillcolor(context),
                    label: 'Project Content',
                    hint:
                        'Provide context about the project, including objectives, stakeholders, and your role.',
                    marginBottom: 20,
                    maxLines: 2,
                  ),
                  MyTextField2(
                    bordercolor: ktransparent,
                    filledColor: getfillcolor(context),
                    label: 'Reflection & Learning',
                    hint:
                        'What did you learn from this experience? How did it contribute to your professional development? What would you do differently?',
                    maxLines: 4,
                    marginBottom: 20,
                  ),
                  MyText(
                    text: 'Attachment',
                    paddingBottom: 8,
                    size: 14,
                    fontFamily: AppFonts.gilroySemiBold,
                  ),
                  AttachmentContainer(),
                  MyButton(
                    mTop: 20,
                    buttonText: 'Add',
                    mBottom: 20,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
