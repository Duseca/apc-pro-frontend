import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class news_info_column extends StatelessWidget {
  final double? size1;
  const news_info_column({super.key, this.size1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              buttonContainer(
                bgColor: getfifth(context),
                radius: 50,
                vPadding: 4,
                text: 'RICS',
                txtColor: getTertiary(context),
              ),
              MyText(
                text: '2 hours ago',
                size: 12,
                color: getTertiary(context),
                paddingLeft: 6,
              )
            ],
          ),
          SizedBox(height: 5,),
          TwoTextedColumn(
            text1:
                'New RICS Guidelines for Sustainable Construction Practices 2024',
            text2:
                'The Royal Institution of Chartered Surveyors releases comprehensive guidelines for implementing sustainable…',
            size1:size1?? 16,
            size2: 12,
            fontFamily: AppFonts.gilroyBold,
            color2: getTertiary(context),
            maxLines: 2,
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Image.asset(
                Assets.imagesRics,
                width: 24,
                height: 24,
              ),
              Expanded(
                  child: MyText(
                text: 'RICS Official',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingLeft: 5,
                color: getTertiary(context),
              )),
              Image.asset(
                Assets.imagesBookmark,
                width: 14,
                color: getTertiary(context),
              )
            ],
          )
        ],
      ),
    );
  }
}
