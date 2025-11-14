import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class GroupCpd extends StatelessWidget {
  const GroupCpd({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                    ListView.builder(
 padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: group_cpd_card(),
                    );
                  },
                ),
      ],
    );
  }
}

class group_cpd_card extends StatelessWidget {
  final String? text1,text2,date,time,img;
  const group_cpd_card({
    super.key, this.text1, this.text2, this.date, this.time, this.img,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 12,
      color: getfillcolor(context),
      vpad: 16,
      hpad: 16,
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonImageView(
            url:img?? dummyImage,
            width: 40,
            height: 40,
            radius: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TwoTextedColumn(
                  text1:text1?? 'Building Regulations Update 2024',
                  text2:text2?? 'Sarah Johnson • RICS Professional Standards',
                  size1: 16,
                  size2: 12,
                  fontFamily: AppFonts.gilroyBold,
                  fontFamily2: AppFonts.gilroyRegular,
                  color2: getTertiary(context),
                  maxLines: 2,
                ),
    
                Row(
                  spacing: 20,
                  children: [
                    row_widget(
                      icon: Assets.imagesCalendar,
                      iconColor: getTertiary(context),
                      title:date?? 'Dec 15, 2024',
                      texSize: 12,
                      iconSize: 14,
                      textColor: getTertiary(context),
                      fontFamily: AppFonts.gilroyMedium,
                    ),
                    row_widget(
                      icon: Assets.imagesTimer,
                      iconColor: getTertiary(context),
                      title:time?? '14:00',
                      texSize: 12,
                      iconSize: 14,
                      textColor: getTertiary(context),
                        fontFamily: AppFonts.gilroyMedium,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          buttonContainer(
                            txtColor: getSecondaryColor(context),
                            bgColor: getfifth(context),
                            text: 'Online',
                            radius: 8,
                            vPadding: 4,
                          ),
                          MyText(
                            text: '2h CPD',
                            size: 13,
                            color: getTertiary(context),
                            paddingLeft: 8,
                          ),
                        ],
                      ),
                    ),
                    buttonContainer(
                      txtColor: getsplashcolor(context),
                      bgColor: getSecondaryColor(context),
                      text: 'Join',
                      radius: 8,
                      vPadding: 7,
                    ),
                  ],
                ),
                Divider(color: getSecondaryColor(context),),
                         row_widget(
                      icon: Assets.imagesBookmark,
                      iconColor: getSecondaryColor(context),
                      title: 'Bookmarked by Sarah',
                      texSize: 12,
                      iconSize: 14,
                      textColor: getSecondaryColor(context),
                        fontFamily: AppFonts.gilroySemiBold,
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
