import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/main.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:get/get.dart';

import 'my_text_widget.dart';

AppBar simpleAppBar(
    {String? title,
    subtitle,
    leadingIcon,
    Widget? title2,
    double? size,
    VoidCallback? onBackIconTap,
    VoidCallback? onMenuTap,
    Color? bgColor,
    Color? contentColor,
    bool chooseChild = false,
    bool hasNonTextedTitle = false,
    bool haveBackButton = true,
    bool centerTitle = false,
    FontWeight? weight,
    List<Widget>? actions,
    bool? hasMenu = false,
    double? toolbarHeight,
    double? leadingSize,
    required BuildContext context,
    bool useCustomFont = false}) {
  return AppBar(
      toolbarHeight: toolbarHeight ?? 38,
      backgroundColor: bgColor ?? getPrimaryColor(context),
      surfaceTintColor: bgColor ?? getPrimaryColor(context),
      centerTitle: centerTitle,
      iconTheme: IconThemeData(
        color: Colors.transparent,
      ),
      leadingWidth: haveBackButton ? leadingSize ?? 40 : 0,
      leading: haveBackButton
          ? Bounce(
              onTap: onBackIconTap ??
                  () {
                    Navigator.pop(context);
                    // Get.back();
                  },
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Image.asset(
                  leadingIcon ?? Assets.imagesBackIcon2,
                  height: 40,
                  width: 40,
                  color: getSecondaryColor(context),
                  //color: contentColor,
                ),
              ),
            )
          : null,
      title: hasNonTextedTitle == true
          ? title2
          :
          //  Text(title??'',style: GoogleFonts.outfit(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w600,
          //   color: kbackground
          // ),),
          MyText(
              text: title ?? '',
              size: size ?? 22,
              weight: weight ?? FontWeight.bold,
              color: contentColor ?? kwhite,
              textAlign: TextAlign.center,
            ),
      actions: actions ?? []);
}

// // ///

// // class homeAppbar extends StatelessWidget {
// //   const homeAppbar({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 22),
// //       child: Row(
// //         children: [
// //           CommonImageView(
// //             url: dummyImage,
// //             width: 50,
// //             height: 50,
// //             radius: 100,
// //           ),
// //           Spacer(),
// //           Row(
// //             spacing: 8,
// //             children: [
// //               Bounce(
// //                 onTap: () {
// //                   Get.dialog(BlockTime());
// //                 },
// //                 child: CustomeContainer(
// //                   vpad: 7,
// //                   hpad: 14,
// //                   borderColor: ksecondary,
// //                   color: klighblue,
// //                   radius: 4,
// //                   widget: MyText(
// //                     text: 'Block Time',
// //                     size: 14,
// //                     weight: FontWeight.w600,
// //                     color: ksecondary,
// //                   ),
// //                 ),
// //               ),
// //               Bounce(
// //                 onTap: () {
// //                   Get.to(()=>Notificationss());
// //                 },
// //                   child: Image.asset(
// //                 Assets.imagesNotification,
// //                 width: 28,
// //                 height: 28,
// //               )),
// //               Bounce(
// //                   child: Image.asset(
// //                 Assets.imagesSettings,
// //                 width: 28,
// //                 height: 28,
// //               )),
// //               SuperTooltip(
// //                   hideTooltipOnBarrierTap: true,
// //
// //                   arrowTipRadius: 3,
// //                   elevation: 0,
// //                   borderColor: kbackground,
// //                   // barrierColor: kbackground.withOpacity(0.2),
// //                   shadowColor: ktransparent,
// //                   arrowLength: 5,
// //                   hideTooltipOnTap: true,
// //                   popupDirection: TooltipDirection.down,
// //                   content: Text(
// //                     "🕒 Block Time: Use this to mark times when you're unavailable for bookings. Clients won’t be able to book you during these slots.",
// //                     textAlign: TextAlign.center,
// //                     softWrap: true,
// //                     style: TextStyle(
// //                         color: kgrey,
// //                         fontFamily: AppFonts.poppins,
// //                         fontWeight: FontWeight.w400),
// //                   ),
// //                   child: Image.asset(
// //                     Assets.imagesInfo,
// //                     width: 15,
// //                     height: 15,
// //                     color: ksecondary,
// //                   )),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
