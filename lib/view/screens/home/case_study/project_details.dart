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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextField2(
          label: 'Project Description',
          hint:
              'Provide a comprehensive description of the project, including scope, objectives, and key deliverables...',
          maxLines: 2,
          marginBottom: 4,
          hintSize: 10,
        ),
        MyText(
          text: '0 characters',
          size: 12,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 20,
        ),
        MyTextField2(
          label: 'Your Role and Responsibilities *',
          hint:
              'Describe your specific role, responsibilities, and level of authority on this project...',
          marginBottom: 20,
          maxLines: 2,
          hintSize: 10,
        ),
        MyTextField2(
          label: 'Scope of work (optional)',
          hint: 'Detail the specific scope of work you were responsible for...',
          marginBottom: 20,
          hintSize: 10,
          maxLines: 2,
        ),
        MyTextField2(
          label: 'Key Project Objectives (optional)',
          hint: 'Enter project objectives',
          hintSize: 10,
          marginBottom: 30,
        ),
        Row(
          children: [
            buttonContainer(
              hPadding: 6,
              borderColor: kblueBorder2,
              text: 'Add Objective',
              vPadding: 4,
              imagePath: Assets.imagesAdd,
              imageSize: 12,
              bgColor: kblackfill,
              iconColor: ksecondary,
              textsize: 11,
            ),
          ],
        )
      ],
    );
  }
}
