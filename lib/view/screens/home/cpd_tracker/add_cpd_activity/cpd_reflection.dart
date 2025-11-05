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
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Reflection & Application',
            size: 16,
            fontFamily: AppFonts.gilroyBold,
            paddingBottom: 20,
          ),
          MyTextField2(
            label: 'Reflection Notes*',
            hint:
                'Reflect on what you learned, how it impacted your understanding, and what insights you gained.......',
       filledColor: getfillcolor(context),
            maxLines: 3,
            bordercolor: ktransparent,
          ),
          MyTextField2(
            label: 'Application to Work*',
            hint:
                'Describe how you have or will apply this learning to your professional work.....',
           filledColor: getfillcolor(context),
            maxLines: 3,
            bordercolor: ktransparent,
          ),
          CustomeContainer(
              radius: 10,
              color: getfillcolor(context),
              borderColor: ktransparent,
              vpad: 17,
              hpad: 17,
              widget: MyText(
                text:
                    "RICS Guidance:\n\nReflection is a key requirement for CPD. Consider what you learned, how it changed your understanding, and how you'll apply it in practice. Good reflection demonstrates professional development and learning.",
                size: 12,
                color: getTertiary(context),
                fontFamily: AppFonts.gilroyMedium,
              ))
        ],
    
    );
  }
}
