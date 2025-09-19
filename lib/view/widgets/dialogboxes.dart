import 'dart:ui';

import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/range_slider.dart';
import 'package:get/get.dart';

class SuccessDialog {
  static void showSuccessDialog(String title,
      {String? message,
      String? textButton,
      String? ButtonText,
      String? button2text,
      bool? hasSecbutton = false,
      bool? hasbutton = true,
      Color? button2color,
      Color? buttontextColor,
      VoidCallback? ontap,
      VoidCallback? ontap2,
      String? image,
      Color? titleColor,
      double? hpadd,
      double? titleSize,
      double? imgSize,
      double? descSize,
      bool? isSvg = false,
      bool? hasTextButton = false}) {
    Get.dialog(
      AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: hpadd ?? 30.0),
        contentPadding: EdgeInsets.only(
            bottom: hasbutton == false ? 10 : 30, left: 5, right: 5),
        backgroundColor: kblack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Column(
          children: [
            if (image != null)
              // CommonImageView(
              //    svgPath:image?? Assets.imagesEmailsvg,
              //      width: 120,
              //     height: 120,
              //     fit: BoxFit.contain,
              // ),
              CommonImageView(
                imagePath: isSvg == false ? image : null,
                svgPath: isSvg == true ? image : null,
                width: imgSize ?? 100,
                height: imgSize ?? 100,
                fit: BoxFit.contain,
              ),
            const SizedBox(height: 5),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                text: title,
                color: titleColor ?? kwhite,
                size: titleSize ?? 20,
                weight: FontWeight.w700,
                paddingTop: 5,
                textAlign: TextAlign.center,
                paddingBottom: message != null ? 5 : 15,
              ),
              if (message != null)
                MyText(
                  text: message,
                  color: kgrey,
                  size: descSize ?? 16,
                  weight: FontWeight.w400,
                  paddingBottom: 20,
                  textAlign: TextAlign.center,
                ),
              if (hasbutton == true)
                if (hasSecbutton == false)
                  MyButton(
                    height: 45,
                    onTap: ontap ?? Get.back,
                    buttonText: ButtonText ?? 'Retry',
                    //fontSize: 14,
                  ),
              if (hasTextButton == true)
                MyText(
                  paddingTop: 10,
                  text: textButton ?? 'Preview Profile',
                  size: 16,
                  fontFamily: AppFonts.gilroyMedium,
                  color: buttontextColor ?? ksecondary,
                  onTap: () {},
                  textAlign: TextAlign.center,
                ),
              if (hasbutton == true && hasSecbutton == true)
                Row(
                  children: [
                    Expanded(
                      child: MyButton(
                        onTap: ontap ?? Get.back,
                        buttonText: ButtonText ?? 'Back to Login',
                        fontSize: 14,
                        backgroundColor: Color(0xffD3D3D3),
                        outlineColor: ktransparent,
                        fontColor: kwhite,
                        height: 45,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: MyButton(
                        onTap: ontap2 ?? Get.back,
                        buttonText: button2text ?? 'Back to Login',
                        fontSize: 14,
                        backgroundColor: button2color ?? ksecondary,
                        height: 45,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// // //

// class FiltersDialog extends StatelessWidget {
//   final String? title, desc, img, buttonText, buttonText2;
//   final VoidCallback? ontap, ontap2;
//   final bool? hasButton2, rating2;

//   const FiltersDialog({
//     super.key,
//     this.title,
//     this.desc,
//     this.img,
//     this.buttonText,
//     this.ontap,
//     this.buttonText2,
//     this.ontap2,
//     this.hasButton2 = false,
//     this.rating2 = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return dialogBoxBody(
//       child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             MyText(
//               text: 'Filters',
//               size: 16,
//               weight: FontWeight.w600,
//               paddingBottom: 20,
//             ),
//             CustomDropDown(
//                 label: 'Service Type',
//                 hint: 'Select service type',
//                 items: ['Select service type', 'service 1', 'service 2'],
//                 selectedValue: 'Select service type',
//                 onChanged: (s) {}),
//             MyText(
//               text: 'Price range',
//               size: 12,
//               fontFamily: AppFonts.gilroyMedium,
//               paddingBottom: 8,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: MyTextField(
//                   hint: 'Min',
//                   labelSize: 12,
//                   hintSize: 11,
//                   hintfontFamily: AppFonts.gilroyMedium,
//                 )),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                     child: MyTextField(
//                   hintSize: 11,
//                   hintfontFamily: AppFonts.gilroyMedium,
//                   hint: 'Max',
//                 ))
//               ],
//             ),
//             PriceRangeSlider(
//               label: '\$',
//             ),
//             MyText(
//               text: 'Distance',
//               size: 12,
//               fontFamily: AppFonts.gilroyMedium,
//               paddingBottom: 8,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: MyTextField(
//                   hint: 'Min',
//                   labelSize: 12,
//                   hintSize: 11,
//                   hintfontFamily: AppFonts.gilroyMedium,
//                 )),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                     child: MyTextField(
//                   hintSize: 11,
//                   hintfontFamily: AppFonts.gilroyMedium,
//                   hint: 'Max',
//                 ))
//               ],
//             ),
//             PriceRangeSlider(
//               max: 100,
//               min: 0,
//               label: 'km',
//             ),
//             MyText(
//               text: 'Location',
//               size: 12,
//               fontFamily: AppFonts.gilroyMedium,
//               paddingBottom: 12,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 radio_option_text(
//                   text: 'Home Based',
//                   active: true,
//                   textSize: 11,
//                   iconSize: 9,
//                   checkSize: 18,
//                 ),
//                 radio_option_text(
//                   text: 'Mobile',
//                   active: false,
//                   textSize: 11,
//                   iconSize: 9,
//                   checkSize: 18,
//                 ),
//                 radio_option_text(
//                   text: 'Workspace',
//                   active: false,
//                   textSize: 11,
//                   iconSize: 9,
//                   checkSize: 18,
//                 ),
//               ],
//             ),
//             MyText(
//               paddingTop: 12,
//               text: 'Top Rated',
//               size: 12,
//               fontFamily: AppFonts.gilroyMedium,
//               paddingBottom: 12,
//             ),
//             Row(
//               children: [
//                 buttonContainer(
//                   onTap: () {
//                     SuccessDialog.showSuccessDialog('No results found',
//                         message:
//                             'We couldn’t find any providers matching your search.',
//                         image: Assets.imagesEmptysearch);
//                   },
//                   radius: 6,
//                   vPadding: 10,
//                   hPadding: 15,
//                   bgColor: klighblue,
//                   text: '4.6+',
//                   fontFamily: AppFonts.gilroyMedium,
//                   txtColor: kdarkSecondary,
//                   textsize: 12,
//                   imagePath: Assets.imagesStarfilled,
//                   iconColor: kdarkSecondary,
//                   imageSize: 13,
//                 ),
//               ],
//             )
//           ]),
//     );
//   }
// }

// //

class dialogBoxBody extends StatelessWidget {
  final Widget? child;
  final double? lpad, rpad, bpad, tpad;
  final Color? barrier;
  final Alignment? alignment;

  const dialogBoxBody({
    super.key,
    this.child,
    this.lpad,
    this.rpad,
    this.bpad,
    this.tpad,
    this.alignment,
    this.barrier,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: (barrier ?? kblack).withOpacity(0.2),
              ),
            ),

            /// Dialog Box
            Align(
              alignment: alignment ?? Alignment.center,
              child: Container(
                width: Get.width,
                margin: EdgeInsets.only(
                  left: lpad ?? 20,
                  top: tpad ?? 20,
                  bottom: bpad ?? 20,
                  right: rpad ?? 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: kblueBorder2),
                  borderRadius: BorderRadius.circular(10),
                  color: kbackground,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 17,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
