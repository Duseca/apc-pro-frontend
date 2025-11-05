import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/community/create_new_event.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityEvent extends StatelessWidget {
  const CommunityEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Events',
          size: 22,
          fontFamily: AppFonts.gilroyBold,
          paddingBottom: 25,
        ),
        MyButton(
          buttonText: ' Create New Event',
          image: Assets.imagesAdd,
          imgColor: getSecondaryColor(context),
          mBottom: 36,
          fontColor: getSecondaryColor(context),
          backgroundColor: ktransparent,
          outlineColor: getSecondaryColor(context),
          onTap: () {
            Get.dialog(CreateNewEvent());
          },
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: community_event_card(),
            );
          },
        ),
      ],
    );
  }
}

class community_event_card extends StatelessWidget {
  final String? title, desc, time, date;
  final VoidCallback? ontap;
  const community_event_card({
    super.key,
    this.title,
    this.desc,
    this.time,
    this.date,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      vpad: 17,
      hpad: 14,
      borderColor: getfifth(context),
      color: getfillcolor(context),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: title ?? 'AMA with Senior Partners - Career Progression',
            size: 14,
            fontFamily: AppFonts.gilroyBold,
          ),
          MyText(
            text: desc ??
                'Join our panel of senior partners as they share insights about career progression post-APC',
            size: 11,
            fontFamily: AppFonts.gilroyMedium,
            paddingBottom: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  row_widget(
                    icon: Assets.imagesCalendar,
                    iconColor: getSecondaryColor(context),
                    iconSize: 15,
                    title: date ?? '2024-02-15',
                    texSize: 11,
                    fontFamily: AppFonts.gilroyMedium,
                  ),
                  row_widget(
                    icon: Assets.imagesClock,
                    iconColor: getSecondaryColor(context),
                    iconSize: 15,
                    title: time ?? '19:00',
                    texSize: 11,
                    fontFamily: AppFonts.gilroyMedium,
                  ),
                ],
              ),
              buttonContainer(
                radius: 6,
                bgColor: ktransparent,
                borderColor: getSecondaryColor(context),
                txtColor: getSecondaryColor(context),
                text: 'Join Online',
                vPadding: 6,
                hPadding: 6,
              )
            ],
          ),
          Divider(color: getfifth(context),)
        ],
      ),
    );
  }
}
