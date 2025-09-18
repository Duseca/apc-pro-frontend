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
        backgroundColor: kbackground,
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
                  CustomDropdown2(
                    label: "Competency *",
                    hint: "Select competency",
                    items: ["competency 1", "competency 2", "competency 3"],
                    value: null,
                    onChanged: (val) {},
                    onInfoTap: () {},
                    hasInfo: false,
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  CustomDropdown2(
                    label: "Competency Level *",
                    hint: "Level 1",
                    items: ["Level 1", "Level 2", "Level 3"],
                    value: null,
                    onChanged: (val) {},
                    onInfoTap: () {},
                    hasInfo: false,
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  MyTextField(
                    hint: 'mm/dd/yyyy',
                    label: 'Start Date *',
                    suffixIcon: Image.asset(
                      Assets.imagesCalendar,
                      width: 18,
                    ),
                    marginBottom: 20,
                  ),
                  StackHintContainer(),
                  Row(
                    children: [
                      Expanded(
                          child: MyText(
                        text: 'Work Description *',
                        size: 16,
                      )),
                      row_widget(
                        title: '0 words',
                        fontFamily: AppFonts.gilroySemiBold,
                        icon: Assets.imagesBulb2,
                        iconSize: 24,
                        isIconRight: true,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MyTextField(
                    hint:
                        'Describe the work undertaken, including your specific role, tasks completed, techniques used, and any challenge encountered',
                    maxLines: 4,
                    marginBottom: 20,
                  ),
                  MyTextField(
                    label: 'Project Content',
                    hint:
                        'e.g., Commercial office refurbishment, Residential.....',
                    marginBottom: 20,
                  ),
                  MyTextField(
                    label: 'Reflection & Learning',
                    hint:
                        '\nWhat did you learn from this experience? How did it contribute to your professional development? What would you do differently?',
                    maxLines: 4,
                    marginBottom: 20,
                  ),
                  StackHintContainer(
                    hint: 'Attachment',
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: row_widget(
                            title: 'Add files',
                            icon: Assets.imagesUpload,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  MyButton(
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
