import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/range_slider.dart';
import 'package:apc_pro/view/widgets/switch_button.dart';
import 'package:flutter/material.dart';

class CustomQuizSettings extends StatelessWidget {
  const CustomQuizSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
            radius: 8,
      borderColor: getSecondaryColor(context),
      color: getfillcolor(context),
     widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: 'Quiz Settings',
                  size: 16,
                  fontFamily: AppFonts.gilroyBold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomDropDown(
            label: 'Question Difficulty',
            hint: 'Easy Only',
            items: ['Easy Only', 'Medium Only', 'Hard Only', 'Mixed Difficulty'],
      
            bgColor: getfifth(context),
            value: 'Easy Only',
            onChanged: (h) {},
          ),
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: 'Timed Mode',
                  size: 14,
                  color: getSecondaryColor(context),
                  fontFamily: AppFonts.gilroyBold,
                  paddingBottom: 8,
                ),
              ),
              SwitchButton(
                scale: 0.8,
                isActive: false,
              ),
            ],
          ),
          CustomeContainer(
              radius: 10,
              
              color: getfifth(context),
              vpad: 15,
              hpad: 14,
              mbott: 20,
              //mtop: 20,
              widget: Row(
                children: [
                  Image.asset(
                    Assets.imagesClock,
                    width: 20,
                  ),
                  Expanded(
                      child: MyText(
                    text:
                        'Quiz will have a 30 minute time limit. Estimated Completion time: 39 min',
                    size: 11,
                    fontFamily: AppFonts.gilroyMedium,
                    paddingLeft: 6,
                  ))
                ],
              )),
                  CustomDropDown(
            label: 'Show Feedback',
            hint: 'At End of Quiz',
            items: ['At End of Quiz', 'Medium Only', 'Hard Only', 'Mixed Difficulty'],
          bgColor: getfifth(context),
            value: 'At End of Quiz',
            onChanged: (h) {},
          ),
      
                MyText(
            paddingTop: 20,
            text: 'Passing Score',
            size: 12,
            fontFamily: AppFonts.gilroyMedium,
            paddingBottom: 9,
          ),
          QuestionSilder(
            i1: '0%',
            i2: '50%',
            i3: '100%',
          ),
      
          MyButton(
            buttonText: 'Continue',
            mTop: 40,
            outlineColor: getSecondaryColor(context),
            backgroundColor: ktransparent,
            fontColor: getSecondaryColor(context),
          ),
        ],
      ),
    );
  }
}
