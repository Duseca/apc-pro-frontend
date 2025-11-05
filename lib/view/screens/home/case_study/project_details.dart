import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      color: getfillcolor(context),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField2(
            label: 'Project Description*',
            hint:
                'Provide a comprehensive description of the project, including scope, objectives, and key deliverables...',
            maxLines: 4,
            marginBottom: 4,
            filledColor: getfifth(context),
          ),
          MyText(
            text: '0 characters',
            size: 12,
            fontFamily: AppFonts.gilroyRegular,
            paddingBottom: 20,
            color: getTertiary(context),
          ),
          MyTextField2(
            label: 'Your Role and Responsibilities *',
            hint:
                'Describe your specific role, responsibilities, and level of authority on this project...',
            marginBottom: 20,
            maxLines: 4,
            filledColor: getfifth(context),
          ),
          MyTextField2(
            label: 'Scope of work (optional)',
            hint: 'Detail the specific scope of work you were responsible for...',
            marginBottom: 20,
            filledColor: getfifth(context),
            maxLines: 4,
          ),
          MyTextField2(
            label: 'Key Project Objectives (optional)',
            hint: 'Enter project objectives',
            maxLines: 2,
            marginBottom: 30,
            filledColor: getfifth(context),
          ),
          Row(
            children: [
              buttonContainer(
                hPadding: 8,
                radius: 5,
                text: 'Add Objective',
                vPadding: 8,
                imagePath: Assets.imagesAdd,
                imageSize: 12,
                bgColor: ktransparent,
                borderColor: getSecondaryColor(context),
                iconColor: getSecondaryColor(context),
                textsize: 11,
              ),
            ],
          )
        ],
      ),
    );
  }
}
