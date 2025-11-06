import 'dart:ui';

import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/common_image_view_widget.dart';
import 'package:apc_pro/view/widgets/my_button.dart';

import 'package:apc_pro/view/widgets/my_text_widget.dart';

import 'package:get/get.dart';

class SuccessDialog {
  static void showSuccessDialog(
    String title,
    BuildContext context, {
    String? message,
    String? textButton,
    String? ButtonText,
    String? button2text,
    bool? hasSecbutton = false,
    bool? hasbutton = true,
    bool twoButtonsInColumn = false,
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
    Color? borderColor,
    Color? bgColor,
    Color? b1Color,
    Color? b2Color,
    Color? b1text,
    Color? b2text,
    Color? iconColor,
    bool? hasTextButton = false,
  }) {
    Get.dialog(
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: hpadd ?? 30.0),
            contentPadding: EdgeInsets.only(
              bottom: hasbutton == false ? 10 : 30,
              left: 5,
              right: 5,
            ),
            backgroundColor: bgColor ?? getfillcolor(context),
            shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: borderColor ?? getSecondaryColor(context)),
              borderRadius: BorderRadius.circular(16),
            ),
            title: Column(
              children: [
                if (image != null) ...{
                  if (isSvg == true)
                    CommonImageView(
                      imagePath: isSvg == false ? image : null,
                      svgPath: isSvg == true ? image : null,
                      width: imgSize ?? 100,
                      height: imgSize ?? 100,
                      fit: BoxFit.contain,
                    ),
                  if (isSvg == false)
                    Image.asset(
                      image,
                      width: imgSize ?? 100,
                      height: imgSize ?? 100,
                      fit: BoxFit.contain,
                      color: iconColor,
                    )
                },
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
                    color: titleColor ?? getSecondaryColor(context),
                    size: titleSize ?? 20,
                    fontFamily: AppFonts.gilroyBold,
                    paddingTop: 5,
                    textAlign: TextAlign.center,
                    paddingBottom: message != null ? 5 : 15,
                  ),
                  if (message != null)
                    MyText(
                      text: message,
                      color: getTertiary(context),
                      size: descSize ?? 14,
                      weight: FontWeight.w400,
                      paddingBottom: 20,
                      textAlign: TextAlign.center,
                    ),
                  if (hasbutton == true && hasSecbutton == false)
                    MyButton(
                      height: 45,
                      onTap: ontap ?? Get.back,
                      buttonText: ButtonText ?? 'Retry',
                    ),
                  if (hasTextButton == true)
                    MyText(
                      paddingTop: 10,
                      text: textButton ?? 'Preview Profile',
                      size: 16,
                      fontFamily: AppFonts.gilroyMedium,
                      color: buttontextColor ?? Colors.blue,
                      onTap: () {},
                      textAlign: TextAlign.center,
                    ),
                  if (hasbutton == true && hasSecbutton == true)
                    twoButtonsInColumn
                        ? Column(
                            children: [
                              MyButton(
                                onTap: ontap2 ?? Get.back,
                                buttonText: ButtonText ?? 'Continue',
                                fontSize: 14,
                                height: 45,
                              ),
                              const SizedBox(height: 15),
                              MyButton(
                                onTap: ontap ?? Get.back,
                                buttonText: button2text ?? 'Back to Login',
                                fontSize: 14,
                                backgroundColor: button2color ?? ktransparent,
                                fontColor: b2text ?? getSecondaryColor(context),
                                outlineColor: getSecondaryColor(context),
                                height: 45,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: MyButton(
                                  onTap: ontap ?? Get.back,
                                  buttonText: ButtonText ?? 'Back to Login',
                                  fontSize: 14,
                                  backgroundColor: b1Color ?? ktransparent,
                                  fontColor:
                                      b1text ?? getSecondaryColor(context),
                                  outlineColor:
                                      b1text ?? getSecondaryColor(context),
                                  height: 45,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: MyButton(
                                  onTap: ontap2 ?? Get.back,
                                  buttonText: button2text ?? 'Continue',
                                  fontSize: 14,
                                  height: 45,
                                ),
                              ),
                            ],
                          ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: getfillcolor(context).withOpacity(0.8),
    );
  }
}

class dialogBoxBody extends StatelessWidget {
  final Widget? child;
  final double? lpad, rpad, bpad, tpad, innerVpad, innerHpad;
  final Color? barrier, borderColor, bgColor;
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
    this.borderColor,
    this.innerVpad,
    this.innerHpad,
    this.bgColor,
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
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color:
                    (barrier ?? getSecondaryColor(context)).withOpacity(0.05),
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
                    border: Border.all(
                        color: borderColor ?? getSecondaryColor(context)),
                    borderRadius: BorderRadius.circular(10),
                    color: bgColor ?? getsplashcolor(context)),
                padding: EdgeInsets.symmetric(
                  vertical: innerVpad ?? 20,
                  horizontal: innerHpad ?? 17,
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
