import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class CpdReflection extends StatelessWidget {
  const CpdReflection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 10,
      color: kblackfill,
      borderColor: kblueBorder4,
      vpad: 17,
      hpad: 17,
      mtop: 30,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Reflection & Application',
            size: 12,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 20,
          ),
          MyTextField(
            label: 'Reflection Notes*',
            hint:
                'Reflect on what you learned, how it impacted your understanding, and what insights you gained.......',
            marginBottom: 25,
            maxLines: 3,
            bordercolor: ksecondary,
          ),
          MyTextField(
            label: 'Application to Work*',
            hint:
                'Describe how you have or will apply this learning to your professional work.....',
            marginBottom: 15,
            maxLines: 3,
            bordercolor: ksecondary,
          ),
          CustomeContainer(
              radius: 10,
              color: kblackfill,
              borderColor: ksecondary,
              vpad: 17,
              hpad: 17,
              widget: MyText(
                text:
                    "RICS Guidance:\nReflection is a key requirement for CPD. Consider what you learned, how it changed your understanding, and how you'll apply it in practice. Good reflection demonstrates professional development and learning.",
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
              ))
        ],
      ),
    );
  }
}
