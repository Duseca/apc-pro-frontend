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

class CreateNewPost extends StatelessWidget {
  const CreateNewPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return dialogBoxBody(
     
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: MyText(
                  text: 'Create New Post',
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
           CustomDropDown(
              hint: '',
              iconColor: getSecondaryColor(context),
              items: [
                'Mandatory Competencies',
                'Case Study Help',
                'Interviews Preparation',
                'CPD Advice',
                'General Chat',
                'Select a forum'
              ],
              onChanged: (value) {},
              value: 'Select a forum',
              label: 'Forum',
            ),
         
            MyTextField2(
              label: 'Title',
              hint: 'What’s your questions and topic',
             filledColor: getfillcolor(context),
             bordercolor: ktransparent,
            ),
        
            MyTextField2(
              label: 'Tags(Optional)',
              hint: 'case study, interview, cpd........',
                filledColor: getfillcolor(context),
             bordercolor: ktransparent,
            ),
            MyButton(
              buttonText: 'Post',
              mTop: 20,
              onTap: () {
                Get.back();
              },
              outlineColor: getSecondaryColor(context),
              fontColor: getSecondaryColor(context),
              backgroundColor: ktransparent,
            )
          ],
        ));
  }
}
