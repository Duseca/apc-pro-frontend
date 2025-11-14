import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/export/export_complete.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportData extends StatelessWidget {
  const ExportData({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'text1': 'CPD Diary',
        'text2': 'Basic CPD details, description, and settings'
      },
      {
        'text1': 'APC Diary',
        'text2': 'Basic APC Diary, description, and settings'
      },
      {
        'text1': 'Summary of Experience',
        'text2': 'Activity status, qualifications, and number of hours'
      },
      {
        'text1': 'Case Study',
        'text2': 'Activity status, qualifications, and number of hours'
      },
      {
        'text1': 'Combined Submission',
        'text2': 'Activity status, qualifications, and number of hours'
      },
      {
        'text1': 'Performance Data',
        'text2': 'Test scores, rankings, and progress analytics'
      },
    ];
    final exportOptions = [
      {
        'text1': 'PDF Document',
        'text2': 'Professional report format with tables and charts'
      },
      {
        'text1': 'CSV Spreadsheet',
        'text2': 'Raw data for analysis and processing'
      },
      {
        'text1': 'Excel Workbook',
        'text2': 'Formatted sheets with formulas and charts'
      },
      {'text1': 'Word', 'text2': 'Word document'},
    ];
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Export Data', centerTitle: true),
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
                    radius: 12,
                    color: getfillcolor(context),
                    vpad: 24,
                    hpad: 24,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Data to Export',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 16,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: checkbox_column(
                                text1: items[index]['text1']!,
                                text2: items[index]['text2']!,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    vpad: 24,
                    hpad: 24,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Export Format',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 16,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: exportOptions.length,
                          itemBuilder: (context, index) {
                            final item = exportOptions[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: checkbox_column(
                                text1: item['text1']!,
                                text2: item['text2']!,
                                isCircle: true,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 12,
                    color: getfillcolor(context),
                    vpad: 24,
                    hpad: 24,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Recent Exports',
                          size: 16,
                          fontFamily: AppFonts.gilroyBold,
                          paddingBottom: 16,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
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
                                      lineHeight: 1.2,
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
                                ));
                          },
                        ),
                        MyButton(
                          mTop: 16,
                          buttonText: ' Download Now',
                          image: Assets.imagesDownload,
                          iconSize: 16,
                        )
                      ],
                    ),
                    mbott: 16,
                  ),
                  MyButton(
                    mTop: 16,
                    buttonText: ' Export Data',
                    image: Assets.imagesDownload,
                    iconSize: 16,
                    onTap: () {
                      Get.to(() => ExportComplete());
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class checkbox_column extends StatelessWidget {
  final String? text1, text2;
  final bool? isCircle;
  const checkbox_column({
    super.key,
    this.text1,
    this.text2,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CustomCheckBox(
          isActive: true,
          onTap: () {},
          radius: 4,
          iscircle: isCircle,
          circleIconsize: 14,
        ),
        Expanded(
            child: TwoTextedColumn(
          text1: text1 ?? 'CPD Dairy',
          mBottom: 0,
          text2: text2 ?? 'Basic CPD details, description, and settings',
          size1: 13.7,
          fontFamily: AppFonts.gilroySemiBold,
          color2: getTertiary(context),
          size2: 11.8,
          lineHeight: 0,
        ))
      ],
    );
  }
}
