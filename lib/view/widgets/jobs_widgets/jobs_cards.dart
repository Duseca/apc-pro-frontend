import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/jobs/job_detail.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class jobs_container extends StatelessWidget {
  final String? title, company, location, salary, postingTime, jobType,icon;
  final String? logo;
  final Color?bgColor,pButColor;
  final double?radius,logoSize,textSize,sText,hpad;
  final bool?hasLike,hasIcon;
  const jobs_container({
    super.key,
    this.title,
    this.company,
    this.location,
    this.salary,
    this.postingTime,
    this.jobType,
    this.logo, this.bgColor, this.radius, this.logoSize, this.hasLike=true, this.hasIcon, this.textSize,  this.sText, this.hpad, this.icon, this.pButColor,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        Get.to(()=>JobDetail());
      },
      child: CustomeContainer(
        vpad: 17,
        hpad:hpad?? 17,
        radius:radius?? 8,
        color:bgColor?? getfillcolor(context),
        widget: Column(
          children: [
            small_job_container(
              logo: logo,
              title: title,
              company: company,
              hasIcon: hasIcon,
              hasLike: hasLike,
              logoSize: logoSize,
              textSize: textSize,
              icon: icon,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              spacing: 12,
              children: [
                row_widget(
                  icon: Assets.imagesLocation,
                  iconColor: getTertiary(context),
                  textColor: getTertiary(context),
                  iconSize: 15,
                  title: location ?? 'San Francisco, CA',
                  texSize: 11,
                  fontFamily: AppFonts.gilroyMedium,
                ),
                row_widget(
                  icon: Assets.imagesClock,
                  iconColor: getTertiary(context),
                  textColor: getTertiary(context),
                  iconSize: 15,
                  title: jobType ?? 'Full-time',
                  texSize: 11,
                  fontFamily: AppFonts.gilroyMedium,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                    child: MyText(
                  text: salary ?? '\$120k - \$150k',
                  size:sText?? 14,
                  fontFamily: AppFonts.gilroySemiBold,
                )),
                buttonContainer(
                  bgColor:pButColor?? getfifth(context),
                  radius: 6,
                  vPadding: 6,
                  hPadding: 6,
                  text: postingTime ?? '2 days ago',
                  txtColor: getTertiary(context),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class small_job_container extends StatelessWidget {
  final String? logo, title, company, postingTime,icon;
  final bool? hasIcon,hasLike;
    final double?logoSize,textSize;
  const small_job_container({
    super.key,
    this.logo,
    this.title,
    this.company,
    this.postingTime,
    this.hasIcon = true, this.hasLike=true,  this.logoSize, this.textSize, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          logo ?? Assets.imagesCompanylogo,
          width:logoSize?? 40,
          height:logoSize?? 40,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TwoTextedColumn(
          text1: title ?? 'Senior Frontend Developer',
          text2: company ?? 'TechFlow Inc.',
          size1:textSize?? 15,
          size2: 12,
          maxLines: 2,
          fontFamily: AppFonts.gilroyBold,
          color2: getTertiary(context),
          mBottom: 0,
        )),
        SizedBox(
          width: 15,
        ),
        if (hasIcon == true&&hasLike==true)
          Bounce(
              child: Image.asset(
          icon??  Assets.imagesHeart,
            color: getTertiary(context),
            width: 15,
          )),
        if (hasIcon == false)
          buttonContainer(
            text: '3d',
            radius: 5,
            bgColor: getfillcolor(context),
            vPadding: 5,
            hPadding: 7,
            textsize: 12,
            txtColor: getTertiary(context),
          )
      ],
    );
  }
}
