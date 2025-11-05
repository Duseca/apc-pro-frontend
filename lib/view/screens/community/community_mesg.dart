import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/screens/community/community_chat.dart';
import 'package:apc_pro/view/screens/notifications/notifications.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityMesg extends StatelessWidget {
  const CommunityMesg({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: MyText(
                text: 'Messages',
                size: 22,
                fontFamily: AppFonts.gilroyBold,
                paddingBottom: 25,
              ),
            ),
            Bounce(
                child: Image.asset(
              Assets.imagesEdit,
              width: 20,
              color: getSecondaryColor(context),
            ))
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: mesg_tile(),
            );
          },
        ),
        Row(
          children: [
            Expanded(
                child: TwoTextedColumn(
              text1: 'Marcus Thompson',
              text2: 'Sent X hours ago',
              size1: 12,
              size2: 10,
              mBottom: 0,
              fontFamily: AppFonts.gilroyBold,
              color2: getTertiary(context),
            )),
            Row(
              spacing: 10,
              children: [
                Bounce(
                    child: Image.asset(
                  isDarkMode ? Assets.imagesDmore : Assets.imagesLmore,
                  width: 36,
                )),
                Bounce(
                  onTap: () {
                    Get.to(()=>Notificationss());
                  },
                    child: Image.asset(
                  isDarkMode ? Assets.imagesDmesgbell : Assets.imagesLmesgbell,
                  width: 36,
                )),
                Bounce(
                    child: Image.asset(
                  isDarkMode ? Assets.imagesDtrash : Assets.imagesLtrash,
                  width: 36,
                )),
              ],
            )
          ],
        ),
               ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: mesg_tile(),
            );
          },
        ),
      ],
    );
  }
}

class mesg_tile extends StatelessWidget {
  final String? title, desc, time, icon;
  final VoidCallback? ontap;
  final bool? hasTime,hasIcon,isStart;
  final Color? borderColor;
  final double? imgSize;
  const mesg_tile({
    super.key,
    this.title,
    this.desc,
    this.time,
    this.icon,
    this.ontap,
    this.hasTime = true,
    this.borderColor, this.hasIcon=false, this.imgSize, this.isStart,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
        onTap: ontap??(){
          Get.to(()=>CommunityChat());
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment:isStart==true?CrossAxisAlignment.center: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color:hasIcon==true?ktransparent: getSecondaryColor(context))
                ),
                padding: EdgeInsets.all(2),
                child: CommonImageView(
                  url:hasIcon==true?null: icon ?? dummyImage,
                  imagePath: hasIcon==true?icon:null,
                  width:imgSize?? 50,
                  height:imgSize?? 50,
                  radius: 100,
                  // fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TwoTextedColumn(
                  text1: title ?? 'Alex Johnson',
                  text2: desc ?? 'Sent yesterday at xx:xx (AM/PM)',
                  size1: 14,
                  size2: 11,
                  fontFamily: AppFonts.gilroyBold,
                  fontFamily2: AppFonts.gilroyMedium,
                  color2: getTertiary(context),
                ),
              ),
              // if (hasTime == true) ...{
              //   SizedBox(
              //     width: 5,
              //   ),
              //   row_widget(
              //     title: time ?? '2 mins ago',
              //     icon: Assets.imagesClock,
              //     iconSize: 16,
              //     iconColor: klighblue,
              //     texSize: 11,
              //   )
              // }
            ],
          )
        ]));
  }
}
