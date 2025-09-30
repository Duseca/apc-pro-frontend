


import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class study_tools_widget extends StatelessWidget {
  final String? title,desc, icon;
  final VoidCallback? ontap;
  const study_tools_widget({
    super.key, this.title, this.desc, this.icon, this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bounce(
          onTap: ontap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
               icon?? Assets.imagesBookmark,
                width: 16,
              ),
              SizedBox(width: 10,),
              Expanded(
                  child: TwoTextedColumn(
                text1:title?? 'Bookmarked Question',
                text2:desc?? '1 question saved for review',
                size1: 11,
                size2: 11,
                fontFamily: AppFonts.gilroyBold,
                fontFamily2: AppFonts.gilroyMedium,
              )),
              Image.asset(Assets.imagesArrowRight,width: 17,)
            ],
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}

class test_competency_widget extends StatelessWidget {
  final String? text1, percent, text2,text3;
  final bool? hasButton;
  const test_competency_widget({
    super.key,
    this.text1,
    this.percent,
    this.text2, this.hasButton=true, this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandedRow(
          text1: text1 ?? 'Business Planning',
          text2: percent ?? '60%',
          size1: 11,
          size2: 14,
          fontFamily2: AppFonts.gilroyBold,
          fontFamily: AppFonts.gilroyMedium,
        ),
        Row(
          children: [
            Expanded(
              child: MyText(
                text: text2 ?? '49 questions answered',
                size: 11,
                fontFamily: AppFonts.gilroyMedium,
              ),
            ),
            if(hasButton==true)
            buttonContainer(
              radius: 4,
              vPadding: 3,
              hPadding: 8,
              text: 'Cancel',
              borderColor: kblueBorder2,
              bgColor: kblackfill,
              textsize: 11,
            ),
                if(hasButton==false&& text3!=null)
            MyText(text:text3?? 'Avg',size: 14,fontFamily: AppFonts.gilroyBold,)
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class performance_overview extends StatelessWidget {
  final String? text1, text2, icon;
  const performance_overview({
    super.key,
    this.text1,
    this.text2,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: ksecondary,
          child: Center(
            child: icon != null
                ? Image.asset(
                    icon ?? Assets.imagesMessg,
                    width: 24,
                  )
                : MyText(
                    text: text1 ?? '82%',
                    size: 20,
                    fontFamily: AppFonts.gilroyBold,
                  ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 70,
          child: MyText(
            text: text2 ?? 'Avrg score',
            size: 12,
            textAlign: TextAlign.center,
            fontFamily: AppFonts.gilroyMedium,
          ),
        ),
      ],
    );
  }
}
