import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMemeberDialog extends StatelessWidget {
  const AddMemeberDialog({super.key});

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
                text: 'Add Team Member',
                size: 20,
                fontFamily: AppFonts.gilroySemiBold,
              )),
              Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Assets.imagesCross,
                    width: 16,
                    color: getSecondaryColor(context),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          MyTextField2(
            label: 'Name',
            hint:
                'Provide a comprehensive description of the project, including scope, objectives, and key deliverables...',
            marginBottom: 20,
            maxLines: 3,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Role',
            hint:
                'Describe your specific role, responsibilities, and level of authority on this project...',
            marginBottom: 20,
            maxLines: 3,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Organization',
            hint:
                'Detail the specific scope of work you were responsible for...',
            marginBottom: 20,
            maxLines: 3,
            filledColor: getfifth(context),
          ),
          CustomDropDown(
            label: 'Reporting Relationship',
            hint: 'Peer/ Colleague',
            items: ['Peer/ Colleague', 'outsiders'],
            value: 'Peer/ Colleague',
            onChanged: (t) {},
            bgColor: getfifth(context),
            bordercolor: getSecondaryColor(context),
//hasInfo: false,
          ),
          MyButton(
            mTop: 25,
            buttonText: 'Add',
            mBottom: 20,
            onTap: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
