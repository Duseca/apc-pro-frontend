import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/cpd_events/cpd_event_detail.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class featurd_events_card extends StatelessWidget {
  final String? title, img;
  const featurd_events_card({
    super.key,
    this.title,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 12,
      width: 300,
      color: getfillcolor(context),
      hpad: 0,
      vpad: 0,
      widget: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: CommonImageView(
              imagePath: img ?? Assets.imagesHouse,
              height: 192,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  spacing: 12,
                  children: [
                    buttonContainer(
                        bgColor: getfifth(context),
                        radius: 6,
                        vPadding: 4,
                        textsize: 12,
                        text: 'FEATURED',
                        txtColor: getSecondaryColor(context)),
                    row_widget(
                      title: 'Jan 10, 2025',
                      icon: Assets.imagesCalender3,
                      iconSize: 13,
                      texSize: 11,
                      textColor: getTertiary(context),
                      iconColor: getTertiary(context),
                    )
                  ],
                ),
                MyText(
                  text: title ?? 'Construction Management Excellence Summit',
                  size: 16,
                  fontFamily: AppFonts.gilroyBold,
                  paddingTop: 10,
                  lineHeight: 1.6,
                  paddingBottom: 10,
                ),
                Row(
                  spacing: 15,
                  children: [
                    row_widget(
                      title: '6h',
                      icon: Assets.imagesClock,
                      iconSize: 13,
                      texSize: 11,
                      textColor: getTertiary(context),
                      iconColor: getTertiary(context),
                    ),
                    row_widget(
                      title: 'Hybrid',
                      icon: Assets.imagesLocation,
                      iconSize: 13,
                      texSize: 11,
                      textColor: getTertiary(context),
                      iconColor: getTertiary(context),
                    ),
                    row_widget(
                      title: '£195',
                      icon: Assets.imagesPound,
                      iconSize: 13,
                      texSize: 11,
                      textColor: getTertiary(context),
                      iconColor: getTertiary(context),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        TagsWidget(
                          borderColor: ktransparent,
                          bgColor: getfifth(context),
                          radius: 6,
                          textSize: 10,
                          'Project Management',
                        ),
                        TagsWidget(
                          borderColor: ktransparent,
                          bgColor: getfifth(context),
                          radius: 6,
                          textSize: 10,
                          'Leadership',
                        ),
                      ],
                    ),
                    Bounce(
                        child: Image.asset(
                      Assets.imagesBookmark,
                      width: 20,
                      color: getSecondaryColor(context),
                    )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      mbott: 16,
    );
  }
}



//
class all_events_card extends StatelessWidget {
  const all_events_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 12,
      color: getfillcolor(context),
      vpad: 16,
      hpad: 16,
      widget: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 6,
                children: [
                 TagsWidget(
                      bgColor: getfifth(context),
                      radius: 6,
                   borderColor: ktransparent,
                      textSize: 10,
                     'WEBINAR',
                     ),
                  row_widget(
                    title: 'Dec 15, 2024 • 14:00',
                    icon: Assets.imagesCalender3,
                    iconSize: 13,
                    texSize: 11,
                    textColor: getTertiary(context),
                    iconColor: getTertiary(context),
                  )
                ],
              ),
              Bounce(
                  child: Image.asset(
                Assets.imagesBookmark,
                width: 20,
                color: getSecondaryColor(context),
              )),
            ],
          ),
          TwoTextedColumn(
            text1: 'Building Regulations Update 2024',
            text2: 'RICS Professional Standards',
            size1: 16,
            size2: 12,
            fontFamily: AppFonts.gilroyBold,
            color2: getTertiary(context),
          ),
          SizedBox(height: 3),
          Row(
            spacing: 15,
            children: [
              row_widget(
                title: '6h',
                icon: Assets.imagesClock,
                iconSize: 13,
                texSize: 11,
                textColor: getTertiary(context),
                iconColor: getTertiary(context),
                fontFamily: AppFonts.gilroyMedium,
              ),
              row_widget(
                title: 'Online',
                icon: Assets.imagesOnline,
                iconSize: 13,
                texSize: 11,
                textColor: getTertiary(context),
                iconColor: getTertiary(context),
                fontFamily: AppFonts.gilroyMedium,
              ),
              row_widget(
                title: '£195',
                icon: Assets.imagesPound,
                iconSize: 13,
                texSize: 11,
                textColor: getTertiary(context),
                iconColor: getTertiary(context),
                fontFamily: AppFonts.gilroyMedium,
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    TagsWidget(
                      'Building Standards',
                      borderColor: ktransparent,
                      bgColor: getfifth(context),
                      radius: 6,
                      textSize: 10,
                    ),
                    TagsWidget(
                      'Compliance',
                      borderColor: ktransparent,
                      bgColor: getfifth(context),
                      radius: 6,
                      textSize: 10,
                    ),
                  ],
                ),
              ),
              MyText(
                text: 'Posted 3 days ago',
                size: 11,
                fontFamily: AppFonts.gilroyMedium,
                color: getTertiary(context),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: MyButton(
                  height: 42,
                  buttonText: 'Register Now',
                  onTap: () {
                    Get.to(()=>CpdEventDetail());
                  },
                ),
              ),
              Bounce(
                  child: Image.asset(
                Assets.imagesShare,
                width: 20,
                color: getSecondaryColor(context),
                height: 24,
              ))
            ],
          )
        ],
      ),
    );
  }
}
//
class twoTexted_icon_row extends StatelessWidget {
  final String? icon, text1, text2, text3;
  final Color? color3;
  const twoTexted_icon_row({
    super.key,
    this.icon,
    this.text1,
    this.text2,
    this.text3,
    this.color3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon ?? Assets.imagesCalender3,
          height: 15,
          color: getSecondaryColor(context),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: text1 ?? 'Date & Time',
              size: 12,
              color: getTertiary(context),
              fontFamily: AppFonts.gilroySemiBold,
              paddingBottom: 5,
            ),
            MyText(
              text: text2 ?? 'Jan 15, 2025',
              size: 13,
              color: getSecondaryColor(context),
              fontFamily: AppFonts.gilroySemiBold,
              paddingBottom: 3,
            ),
            MyText(
              text: text3 ?? '09:00 - 17:00',
              size: 13,
              color: color3 ?? getSecondaryColor(context),
              fontFamily: AppFonts.gilroySemiBold,
            )
          ],
        ))
      ],
    );
  }
}
