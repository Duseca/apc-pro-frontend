import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/mesg_tiles.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class CommunityChat extends StatelessWidget {
  const CommunityChat({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            hasNonTextedTitle: true,
            toolbarHeight: 80,
            title2: Row(
              children: [
                CommonImageView(
                  url: dummyImage,
                  width: 32,
                  radius: 100,
                  height: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TwoTextedColumn(
                  text1: '@username',
                  text2: 'Active 47m ago',
                  size1: 14,
                  size2: 10,
                  mBottom: 0,
                  fontFamily: AppFonts.gilroyBold,
                  color2: getTertiary(context),
                )),
              ],
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                reverse: true,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [

                  MessageTile(isSentBy: true, message: 'Hello how are you?'),
                     MessageTile(isSentBy: false, message: 'Hello how are you?')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: MyTextField2(
                    radius: 50,
                    hint: 'Write a message...',
                    bordercolor: ktransparent,
                    filledColor: getfillcolor(context),
                    marginBottom: 0,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Assets.imagesMicrophone,
                          color: getTertiary(context),
                          width: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          Assets.imagesAttachment2,
                          color: getTertiary(context),
                          width: 18,
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 12,
                  ),
                  Bounce(
                      child: Image.asset(
                    isDarkMode ? Assets.imagesDsend : Assets.imagesLsend,
                    width: 50,
                  ))
                ],
              ),
            )
          ],
        ));
  }
}
