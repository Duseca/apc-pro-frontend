import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class forumCard extends StatelessWidget {
  final String? title, desc, text3;
  final VoidCallback? ontap;
  final bool? hasIcon;

  const forumCard({
    super.key,
    this.title,
    this.desc,
    this.text3,
    this.ontap,
    this.hasIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
        onTap: ontap ?? () {},
        child: CustomeContainer(
            radius: 8,
            vpad: 13,
            hpad: 17,
            mbott: 12,
            //  borderColor: kblueBorder4,
            color: getfillcolor(context),
            widget:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TwoTextedColumn(
                          text1: title ?? 'Mandatory Competencies',
                          text2: desc ??
                              'Discuss professional ethics, conduct, and communication',
                          size1: 14,
                          fontFamily: AppFonts.gilroySemiBold,
                          size2: 12,
                          fontFamily2: AppFonts.gilroyMedium,
                          color2: getTertiary(context),
                          mBottom: 5,
                          maxLines: 2,
                        ),
                        MyText(
                          paddingTop: 5,
                          text: text3 ?? '3245 members | 1325 posts',
                          size: 11,
                          fontFamily: AppFonts.gilroyMedium,
                          color: getTertiary(context),
                        )
                      ],
                    ),
                  ),
                  if (hasIcon == true)
                    Image.asset(
                      Assets.imagesForward,
                      width: 18,
                      color: getTertiary(context),
                    )
                ],
              ),
              if (hasIcon == false) ...{
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 24,
                  children: [
                    Row(
                      children: [
                        MyText(
                          text: 'by Sarah Chen | ',
                          size: 10,
                          fontFamily: AppFonts.gilroyMedium,
                          color: getTertiary(context),
                          paddingTop: 8,
                          paddingBottom: 8,
                        ),
                        row_widget(
                          icon: Assets.imagesComment,
                          iconColor: getTertiary(context),
                          textColor: getTertiary(context),
                          iconSize: 15,
                          title: '12',
                          texSize: 11,
                          fontFamily: AppFonts.gilroyMedium,
                        ),
                      ],
                    ),
                    row_widget(
                      icon: Assets.imagesClock,
                      iconColor: getTertiary(context),
                      textColor: getTertiary(context),
                      iconSize: 15,
                      title: '3 days ago',
                      texSize: 11,
                      fontFamily: AppFonts.gilroyMedium,
                    ),
                  ],
                ),
              }
            ])));
  }
}

class new_post_container extends StatelessWidget {
  final String? text1, text2, icon;
  final VoidCallback? ontap;
  const new_post_container({
    super.key,
    this.text1,
    this.text2,
    this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ontap,
      child: CustomeContainer(
        radius: 10,
        vpad: 17,
        hpad: 17,
        mbott: 22,
        color: getfillcolor(context),
        widget: Column(
          children: [
            Image.asset(icon ?? Assets.imagesAdd,
                width: 24, height: 24, color: getSecondaryColor(context)),
            SizedBox(
              height: 7,
            ),
            TwoTextedColumn(
              text1: text1 ?? 'New Post',
              text2: text2 ?? 'Share & Discuss',
              size1: 16,
              size2: 12,
              fontFamily: AppFonts.gilroyBold,
              fontFamily2: AppFonts.gilroyMedium,
              align: TextAlign.center,
              alignment: ColumnAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}

class community_recent_activity_card extends StatelessWidget {
  final String? title, desc, likes, comments, time;
  final bool? hasComments;
  const community_recent_activity_card({
    super.key,
    this.title,
    this.desc,
    this.likes,
    this.comments,
    this.time,
    this.hasComments = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
        radius: 10,
        vpad: 13,
        hpad: 17,
        mbott: 12,
        color: getfillcolor(context),
        widget: Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: title ??
                    'How to structure your case study for maximum .......',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 8,
              ),
              ExpandedRow(
                text1: 'By Sarah',
                text2: '3 Days Ago',
                size1: 11,
                fontFamily: AppFonts.gilroyMedium,
                size2: 11,
                fontFamily2: AppFonts.gilroyMedium,
                color2: getTertiary(context),
                color1: getTertiary(context),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                spacing: 24,
                children: [
                  row_widget(
                    icon: Assets.imagesHeart,
                    iconSize: 16,
                    title: likes ?? '31',
                    texSize: 12,
                    fontFamily: AppFonts.gilroyMedium,
                    iconColor: getTertiary(context),
                    textColor: getTertiary(context),
                  ),
                  row_widget(
                    icon: Assets.imagesComment,
                    iconSize: 16,
                    title: comments ?? '12',
                    texSize: 12,
                    fontFamily: AppFonts.gilroyMedium,
                    iconColor: getTertiary(context),
                    textColor: getTertiary(context),
                  ),
                ],
              ),
              if (hasComments == true) ...{
                Divider(
                  color: getfifth(context),
                ),
                ListView.builder(
                  padding: EdgeInsets.only(top: 14),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TwoTextedColumn(
                        text1: 'James P.',
                        text2:
                            'I usually declare the conflict early and let the client decide how to proceed.',
                        color2: getTertiary(context),
                        color1: getSecondaryColor(context),
                        align: TextAlign.start,
                        size1: 13,
                        size2: 12,
                        fontFamily: AppFonts.gilroySemiBold,
                        fontFamily2: AppFonts.gilroyMedium,
                        weight2: FontWeight.w500,
                      ),
                    );
                  },
                ),
              }
            ],
          )
        ]));
  }
}
