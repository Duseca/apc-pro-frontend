import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/tags_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class GroupChat extends StatelessWidget {
  const GroupChat({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        row_widget(
          icon: Assets.imagesSpeaker,
          iconSize: 15,
          title: 'Community Updates',
          fontFamily: AppFonts.gilroyMedium,
          iconColor: getSecondaryColor(context),
        ),
        MyText(
          paddingTop: 8,
          text:
              'Share quick updates, announcements, and professional insights with the RICS community. Keep posts brief and focused.',
          weight: FontWeight.w500,
          paddingBottom: 20,
        ),
        CustomeContainer(
          radius: 8,
          color: getfillcolor(context),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonImageView(
                    url: dummyImage,
                    radius: 100,
                    width: 40,
                    height: 40,
                  ),
                  Expanded(
                      child: MyTextField2(
                    hint: "What's happening in your professional world?",
                    maxLines: 3,
                  ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyText(
                        text: '150 characters remaining',
                        size: 12,
                        color: getTertiary(context)),
                  ),
                  TagsWidget(
                    'Post',
                    bgColor: getSecondaryColor(context),
                    textColor: getsplashcolor(context),
                    radius: 6,
                  )
                ],
              )
            ],
          ),
          mbott: 16,
        ),
        ListView.builder(
          reverse: true,
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: group_chat_widget(),
            );
          },
        ),
        // s
      ],
    );
  }
}

class group_chat_widget extends StatelessWidget {
  final String? img, name, email, time, mesg;
  const group_chat_widget({
    super.key,
    this.img,
    this.name,
    this.email,
    this.time,
    this.mesg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonImageView(
              url: img ?? dummyImage,
              width: 40,
              height: 40,
              radius: 100,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DiffTextsTxt(
                  text1: name ?? 'Sarah Johnson',
                  text2: ' ',
                  text3: email ?? '@sarahjohnson2345',
                  size: 14,
                  size2: 12,
                  color1: getSecondaryColor(context),
                  color2: getTertiary(context),
                  color3: getTertiary(context),
                  fontFamily: AppFonts.gilroyBold,
                  fontFamily2: AppFonts.gilroyRegular,
                ),
                MyText(
                  text: time ?? '8:12PM',
                  size: 12,
                  color: getTertiary(context),
                  paddingTop: 4,
                )
              ],
            ))
          ],
        ),
        MyText(
          text: mesg ?? 'I have completed the  80% of my task for today',
          size: 14,
          color: getSecondaryColor(context),
          paddingTop: 6,
          fontFamily: AppFonts.gilroyMedium,
        )
      ],
    );
  }
}
