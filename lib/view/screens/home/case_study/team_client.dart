import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/case_study/add_memeber_dialog.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamClient extends StatelessWidget {
  const TeamClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Client Information',
          size: 16,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 15,
        ),
        MyTextField2(
          label: 'Client Name (Optional)',
          hint: 'Client or organization name',
          marginBottom: 20,
          hintSize: 10,
        ),
        MyTextField2(
          label: 'Client Type',
          hint:
              'Describe your specific role, responsibilities, and level of authority on this project...',
          marginBottom: 20,
          maxLines: 2,
          hintSize: 10,
        ),
        MyTextField2(
          label: 'Client Description (optional)',
          hint: 'Detail the specific scope of work you were responsible for...',
          marginBottom: 20,
          hintSize: 10,
          maxLines: 2,
        ),
        CustomeContainer(
          radius: 10,
          vpad: 17,
          hpad: 17,
          borderColor: kblueBorder3,
          color: kblackfill,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  row_widget(
                    icon: Assets.imagesUsers,
                    iconSize: 18,
                    title: 'Project Team',
                    texSize: 14,
                    fontFamily: AppFonts.gilroyBold,
                  ),
                  buttonContainer(
                    onTap: () {
                      Get.dialog(AddMemeberDialog());
                    },
                    borderColor: kblueBorder2,
                    text: 'Add Team Member',
                    vPadding: 2,
                    hPadding: 4,
                    imagePath: Assets.imagesAdd,
                    imageSize: 12,
                    bgColor: kblackfill,
                    iconColor: ksecondary,
                    textsize: 11,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Image.asset(
                Assets.imagesUsers,
                width: 24,
              )),
              MyText(
                paddingTop: 12,
                text:
                    'No Team members added yetAdd key stakeholders and team members',
                textAlign: TextAlign.center,
                fontFamily: AppFonts.gilroyMedium,
              )
            ],
          ),
        )
      ],
    );
  }
}
