import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AttachmentContainer extends StatelessWidget {
  final String? hint;
  final Widget? widget;
  const AttachmentContainer({super.key, this.hint, this.widget});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: Radius.circular(8),
      borderType: BorderType.RRect,
      color: getSecondaryColor(context),
      dashPattern: [4,4],
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
      child: Column(
        children: [
        Center(child: Image.asset(Assets.imagesAttachment,width: 40,)),
                 Center(
              child: MyText(
                paddingTop: 10,
            text:
                'Add files',
            size: 14,
            color: getTertiary(context),
            textAlign: TextAlign.center,
            paddingBottom: 4,
            fontFamily: AppFonts.gilroyMedium,
          )),
          Center(
              child: MyText(
            text:
                'Upload supporting documents, images, or other relevant files',
            size: 12,
            color: getTertiary(context),
            textAlign: TextAlign.center,
          )),
      
        ],
      ),
    );
  }
}
