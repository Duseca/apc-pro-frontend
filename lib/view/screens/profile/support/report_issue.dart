import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ReportIssue extends StatelessWidget {
  const ReportIssue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyTextField2(
          hint: 'Write the title here',
          label: 'Title of report',
          filledColor: getfillcolor(context),
        ),
        MyTextField2(
          hint: 'Attach file or image here',
          label: 'Attachments(optional)',
          prefixIcon: Image.asset(
            Assets.imagesAttachment2,
            color: getSecondaryColor(context),
            width: 16,
          ),
          filledColor: getfillcolor(context),
        ),
        MyTextField2(
          hint: 'Write in detail here',
          label: 'Description',
          maxLines: 5,
          filledColor: getfillcolor(context),
        ),
        MyButton(
          buttonText: 'Send Report',
          outlineColor: getSecondaryColor(context),
          backgroundColor: getfillcolor(context),
          fontColor: getSecondaryColor(context),
        )
      ],
    );
  }
}
