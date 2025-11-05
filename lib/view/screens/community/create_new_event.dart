import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewEvent extends StatelessWidget {
  const CreateNewEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return dialogBoxBody(
      bgColor: getfillcolor(context),
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: MyText(
              text: 'Create New Event',
              size: 18,
              fontFamily: AppFonts.gilroyBold,
            )),
            Image.asset(
              Assets.imagesCross,
              width: 15,
              color: getSecondaryColor(context),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        MyTextField2(
          label: 'Event Title',
          hint: 'Write event title',
          filledColor: getfifth(context),
          bordercolor: ktransparent,
        ),
        Row(
          spacing: 20,
          children: [
            Expanded(
              child: MyTextField2(
                label: 'Date',
                hint: 'Select Date',
                suffixIcon: Image.asset(
                  Assets.imagesCalendar,
                  color: getSecondaryColor(context),
                  width: 16,
                ),
                filledColor: getfifth(context),
                bordercolor: ktransparent,
              ),
            ),
            Expanded(
              child: MyTextField2(
                label: 'Time',
                hint: 'Select Time',
                suffixIcon: Image.asset(
                  Assets.imagesCalendar,
                  color: getSecondaryColor(context),
                  width: 16,
                ),
                filledColor: getfifth(context),
                bordercolor: ktransparent,
              ),
            ),
          ],
        ),
        MyTextField2(
          label: 'Description',
          hint: 'Write about the event',
          maxLines: 4,
          filledColor: getfifth(context),
          bordercolor: ktransparent,
        ),
        MyButton(
          buttonText: 'Create',
          outlineColor: getSecondaryColor(context),
          fontColor: getSecondaryColor(context),
          backgroundColor: ktransparent,
          mTop: 20,
          onTap: () {
            Get.back();
          },
        )
      ],
    ));
  }
}
