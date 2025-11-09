import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/groups/rics_professional.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class create_group_widget extends StatelessWidget {
  final String? text1, text2, icon, buttonText;
  final bool? hasCode;
  const create_group_widget({
    super.key,
    this.text1,
    this.text2,
    this.icon,
    this.hasCode = false,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return CustomeContainer(
      radius: 12,
      mbott: 16,
      color: getfillcolor(context),
      widget: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                isDarkMode ? Assets.imagesAddgroup : Assets.imagesAddgroupl,
                width: 48,
                height: 48,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TwoTextedColumn(
                      text1: text1 ?? 'Create New Group',
                      text2: text2 ??
                          'Create a group and bring teammates together for quizzes and leaderboards.',
                      size1: 20,
                      size2: 14,
                      color2: getTertiary(context),
                      color1: getSecondaryColor(context),
                      fontFamily: AppFonts.gilroyBold,
                    ),
                    if (hasCode == true) ...{
                      SizedBox(
                        height: 16,
                      ),
                      MyTextField2(
                        hint: 'Enter 6-digit code',
                        label: 'Group Code',
                        marginBottom: 2,
                      ),
                    },
                    MyButton(
                      mTop: 16,
                      buttonText: buttonText ?? 'Create Group',
                      onTap: () {
                        Get.to(() => RicsProfessional());
                      },
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//

class no_group_container extends StatelessWidget {
  final String? text1, text2;
  final Color? bgcolor;
  final double? radius;
  const no_group_container({
    super.key,
    this.text1,
    this.text2,
    this.bgcolor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: radius ?? 12,
      color: bgcolor ?? getfillcolor(context),
      vpad: 16,
      hpad: 16,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: getfifth(context),
            child: Image.asset(
              Assets.imagesUsers,
              color: getSecondaryColor(context),
              width: 20,
            ),
          ),
          MyText(
            paddingTop: 16,
            paddingBottom: 16,
            text: text1 ?? 'No groups yet',
            textAlign: TextAlign.center,
            fontFamily: AppFonts.gilroyBold,
            size: 25,
          ),
          MyText(
            text: text2 ??
                'Create your first group or join one to start shared quiz results and leaderboards.',
            textAlign: TextAlign.center,
            fontFamily: AppFonts.gilroyRegular,
            color: getTertiary(context),
            size: 14,
          )
        ],
      ),
      mbott: 16,
    );
  }
}
