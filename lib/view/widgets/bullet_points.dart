
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/diff_texts_txt.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class MyBullet extends StatelessWidget {
  MyBullet(
      {super.key, required this.point, this.color, this.weight, this.size, this.bulletIcon,this.iconSize});
  String point;
  Color? color;
  FontWeight? weight;
  double? size,iconSize;
  final String? bulletIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  if(bulletIcon!=null)...{
          // Image.asset(bulletIcon??Assets.imagesCheck2,width:iconSize?? 20,),
          // SizedBox(width: 8,)
          // },
          // if(bulletIcon==null)
          MyText(
            text: '•',
            size: 14,
            // paddingLeft: 5,
            paddingBottom: 6,
            paddingRight: 8,
            color: kwhite,
          ),
          Expanded(
            child: MyText(
              text: point,
              size: size ?? 12,
              color: color ?? kwhite,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 4,
              weight: weight ?? FontWeight.w400,
              paddingRight: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class bullet_diff_texts extends StatelessWidget {
  final String? text1, text2,bulletIcon,bullettype;
  final bool? isStart;
  const bullet_diff_texts({super.key, this.text1, this.text2, this.bulletIcon, this.bullettype, this.isStart=false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: isStart==true? CrossAxisAlignment.start:CrossAxisAlignment.center,
      children: [
      //   if(bulletIcon!=null)...{
      //   Image.asset(Assets.imagesCheck2,width: 20,),
      //   SizedBox(width: 5,)
      //   },
      //   if(bulletIcon==null)
        MyText(
          text:bullettype?? '•',
          size: 14,
          // paddingLeft: 5,
          paddingBottom: 6,
          paddingRight: 5,
          color: kblack,
        ),
        Expanded(
          child: DiffTextsTxt(
            text1: text1 ?? 'Fed State ',
            text2: text2 ??
                '(0-4 hours after eating): Body uses glucose from food for energy',
            color1: kblack,
            color2: kblack,
            size2: 12,
            size: 12,
            weight1: FontWeight.w600,
            weight2: FontWeight.normal,
            align: TextAlign.start,
          ),
        )
      ],
    );
  }
}
