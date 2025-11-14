import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/home/case_study/add_memeber_dialog.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamClient extends StatelessWidget {
  const TeamClient({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      color: getfillcolor(context),
     widget: Column(
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
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Client Type',
            hint:
                'Describe your specific role, responsibilities, and level of authority on this project...',
            marginBottom: 20,
            maxLines: 3,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Client Description (optional)',
            hint: 'Detail the specific scope of work you were responsible for...',
            marginBottom: 20,
            filledColor: getfifth(context),
            maxLines: 3,
          ),
          CustomeContainer(
            radius: 10,
            vpad: 17,
            hpad: 17,
            color: getfillcolor(context),
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  paddingTop: 12,
                  text: 'Project Team',
                  fontFamily: AppFonts.gilroyBold,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Image.asset(
                  Assets.imagesUsers,
                  width: 48,
                )),
                Center(
                  child: MyText(
                    paddingTop: 12,
                    text:
                        'No Team members added yet',
                    textAlign: TextAlign.center,
                    fontFamily: AppFonts.gilroyMedium,
                    size: 16,
                  ),
                ),
                Center(
                  child: MyText(
                    paddingTop: 12,
                    text: 'Add key stakeholders and team members',
                    textAlign: TextAlign.center,
                    fontFamily: AppFonts.gilroyMedium,
                    color: getTertiary(context),
                    paddingBottom: 20,
                    size: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonContainer(
                      onTap: () {
                        Get.dialog(AddMemeberDialog());
                      },
                      text: 'Add Team Member',
                      vPadding: 8,
                      hPadding: 8,
                      radius: 5,
                      bgColor: getfillcolor(context),
                      borderColor: getSecondaryColor(context),
                      textsize: 11,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
