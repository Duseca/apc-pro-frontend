import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportComplete extends StatelessWidget {
  const ExportComplete({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Export Complete',
            centerTitle: true,
            actions: [
              Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Assets.imagesCross,
                    width: 15,
                    color: getSecondaryColor(context),
                  )),
              SizedBox(
                width: 15,
              )
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomeContainer(
                    vpad: 24,
                    hpad: 24,
                    color: getfillcolor(context),
                    widget: Column(
                      children: [
                        Center(
                            child: Image.asset(
                          isDarkMode
                              ? Assets.imagesSuccessd
                              : Assets.imagesSuccessl,
                          width: 64,
                        )),
                        SizedBox(
                          height: 24,
                        ),
                        TwoTextedColumn(
                          text1: 'Export Successful!',
                          text2:
                              'Your data has been successfully exported and is ready for download.',
                          fontFamily2: AppFonts.gilroyMedium,
                          fontFamily: AppFonts.gilroyBold,
                          size2: 13.9,
                          size1: 20,
                          align: TextAlign.center,
                          alignment: ColumnAlignment.center,
                          color2: getTertiary(context),
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    vpad: 24,
                    hpad: 24,
                    color: getfillcolor(context),
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Export Details',
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 16,
                          ),
                          icon_expanded_row(),
                          icon_expanded_row(
                            text1: 'File Size',
                            text2: '2.4 MB',
                            icon: Assets.imagesFile,
                          ),
                          icon_expanded_row(
                            text1: 'Export Date',
                            text2: 'Dec 15, 2024',
                            icon: Assets.imagesCalender3,
                          ),
                          icon_expanded_row(
                            text1: 'Export Time',
                            text2: '2:34 PM',
                            icon: Assets.imagesClock,
                          )
                        ]),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    vpad: 24,
                    hpad: 24,
                    color: getfillcolor(context),
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Download File',
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 16,
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Image.asset(
                                Assets.imagesFolder2,
                                width: 35,
                                height: 48,
                              ),
                              Expanded(
                                  child: TwoTextedColumn(
                                text1: 'RICS_Professionals_Export.pdf',
                                mBottom: 0,
                                text2: '2.4 MB • Ready for download',
                                size1: 13.7,
                                fontFamily: AppFonts.gilroySemiBold,
                                color2: getTertiary(context),
                                size2: 11.8,
                                // lineHeight: 1.2,
                                maxLines: 2,
                              )),
                              Bounce(
                                  child: Image.asset(
                                isDarkMode
                                    ? Assets.imagesExport3
                                    : Assets.imagesExport3l,
                                width: 40,
                              ))
                            ],
                          ),
                          MyButton(
                            mTop: 24,
                            buttonText: ' Download Now',
                            image: Assets.imagesDownload,
                            iconSize: 16,
                          )
                        ]),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    vpad: 24,
                    hpad: 24,
                    color: getfillcolor(context),
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Share Options',
                            size: 16,
                            fontFamily: AppFonts.gilroyBold,
                            paddingBottom: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    Assets.imagesEmail2,
                                    width: 22,
                                    color: getSecondaryColor(context),
                                  ),
                                  MyText(
                                    text: 'Email',
                                    fontFamily: AppFonts.gilroyMedium,
                                    paddingTop: 8,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    Assets.imagesShare2,
                                    width: 22,
                                    color: getSecondaryColor(context),
                                  ),
                                  MyText(
                                    text: 'Share',
                                    fontFamily: AppFonts.gilroyMedium,
                                    paddingTop: 8,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    Assets.imagesCloud,
                                    width: 22,
                                    color: getSecondaryColor(context),
                                  ),
                                  MyText(
                                    text: 'Cloud',
                                    fontFamily: AppFonts.gilroyMedium,
                                    paddingTop: 8,
                                  )
                                ],
                              ),
                            ],
                          )
                        ]),
                    mbott: 16,
                  ),
                  MyButton(
                    buttonText: ' Return to Main screen',
                    backgroundColor: getfillcolor(context),
                    fontColor: getSecondaryColor(context),
                    imgColor: getSecondaryColor(context),
                    icon: Icons.arrow_back_rounded,
                    iconSize: 16,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class icon_expanded_row extends StatelessWidget {
  final String? icon, text1, text2;
  const icon_expanded_row({
    super.key,
    this.icon,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        spacing: 8,
        children: [
          Image.asset(
            icon ?? Assets.imagesDocument,
            width: 16,
            height: 16,
            color: getSecondaryColor(context),
          ),
          Expanded(
              child: ExpandedRow(
            text1: text1 ?? 'File Format',
            text2: text2 ?? 'PDF Document',
            fontFamily2: AppFonts.gilroyBold,
            color1: getTertiary(context),
          ))
        ],
      ),
    );
  }
}
