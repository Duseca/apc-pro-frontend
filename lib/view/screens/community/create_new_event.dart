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
        borderColor: kblueBorder3,
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
                  color: kwhite,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              label: 'Event Title',
              hint: 'Write event title',
              marginBottom: 25,
            ),
            Row(
              spacing: 20,
              children: [
                Expanded(
                  child: MyTextField(
                    label: 'Date',
                    hint: 'Select Date',
                    marginBottom: 25,
                    suffixIcon: Image.asset(
                      Assets.imagesCalendar,
                      color: klighblue,
                      width: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: MyTextField(
                    label: 'Time',
                    hint: 'Select Time',
                    marginBottom: 25,
                    suffixIcon: Image.asset(
                      Assets.imagesCalendar,
                      color: klighblue,
                      width: 16,
                    ),
                  ),
                ),
              ],
            ),
            MyTextField(
              label: 'Description',
              hint: 'Write about the event',
              maxLines: 4,
              marginBottom: 25,
            ),
            MyButton(
              buttonText: 'Create',
              mTop: 20,
              onTap: () {
                Get.back();
              },
            )
          ],
        ));
  }
}
