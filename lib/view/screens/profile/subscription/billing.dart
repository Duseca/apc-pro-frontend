import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/screens/profile/subscription/subscription_info.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/profile_widgets/profile_widgets.dart';
import 'package:flutter/material.dart';

class Billing extends StatelessWidget {
  const Billing({super.key});

  @override
  Widget build(BuildContext context) {
    final List items = [
      {
        'text1': 'Personal Information',
        'text2':
            'Profile details, contact information Account settings and preferences'
      },
      {
        'text1': 'Learning Progress',
        'text2':
            'Quiz results and scores\nCompletion certificates\nStudy time and streaks'
      },
      {
        'text1': 'Community Activity',
        'text2':
            'Forum posts and comments\nDiscussions and replies\nSaved items and bookmarks'
      },
      {
        'text1': 'Subscription Data',
        'text2':
            'Billing history and invoices\nPayment information (excluding sensitive details)'
      }
    ];
    final List export = [
      {'text1': 'JSON format', 'text2': '(recommended for data portability)'},
      {'text1': 'CSV format', 'text2': '(for spreadsheet import)'},
      {'text1': 'PDF format', 'text2': '(human-readable report)'},
    ];
    return Scaffold(
        appBar: simpleAppBar(
          context: context,
          title: 'Subscription & Billing',
        ),
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
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8, top: 8),
                              child: Divider(
                                color: getfifth(context),
                              ),
                            );
                          },
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return twotexted_checkbox(
                              text1: item['text1'],
                              text2: item['text2'],
                              isSelected: index == 1 ? true : false,
                            );
                          },
                        ),
                      ],
                    ),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Export Format',
                            fontFamily: AppFonts.gilroyBold,
                            size: 16,
                            paddingBottom: 16,
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, top: 8),
                              );
                            },
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: export.length,
                            itemBuilder: (context, index) {
                              final item = export[index];
                              return export_format(
                                text1: item['text1'],
                                text2: item['text2'],
                                isSelected: index == 1 ? true : false,
                              );
                            },
                          ),
                        ]),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Export Options',
                            fontFamily: AppFonts.gilroyBold,
                            size: 16,
                            paddingBottom: 16,
                          ),
                          notification_pref_row(
                              title: 'Include attachments and images.')
                        ]),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Data Information',
                            fontFamily: AppFonts.gilroyBold,
                            size: 16,
                            paddingBottom: 16,
                          ),
                          ExpandedRow(
                              text1: 'Estimated file size:',
                              fontFamily2: AppFonts.gilroyMedium,
                              fontFamily: AppFonts.gilroyMedium,
                              text2: '~2.5 MB'),
                          SizedBox(
                            height: 10,
                          ),
                          ExpandedRow(
                            text1: 'Processing time:',
                            text2: 'Usually takes 2-3 minutes',
                            fontFamily2: AppFonts.gilroyMedium,
                            fontFamily: AppFonts.gilroyMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: getfifth(context),
                            ),
                          ),
                          MyText(
                            text:
                                'Data retention policy: Exported files are automatically deleted from our servers after 30 days. Download your export before it expires.',
                            color: getTertiary(context),
                          )
                        ]),
                    mbott: 16,
                  ),
                  CustomeContainer(
                    radius: 8,
                    color: getfillcolor(context),
                    vpad: 16,
                    hpad: 16,
                    widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          row_widget(
                            texSize: 16,
                            title: 'Security Notice',
                            icon: Assets.imagesSecurity,
                            iconSize: 16,
                            iconColor: getSecondaryColor(context),
                            fontFamily: AppFonts.gilroyBold,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          MyBullet(
                            point: 'Your data will be encrypted during export',
                            size: 14,
                          ),
                          MyBullet(
                            point: 'Download link expires in 24 hours',
                            size: 14,
                          ),
                          MyBullet(
                            point: 'Only you can access the export file',
                            size: 14,
                          )
                        ]),
                    mbott: 16,
                  ),
                  MyButton(
                    buttonText: 'Request Export',
                    mBottom: 16,
                  ),
                  CustomeContainer(
                      radius: 8,
                      color: getfillcolor(context),
                      vpad: 16,
                      hpad: 16,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Previous Exports',
                              fontFamily: AppFonts.gilroyBold,
                              size: 16,
                              paddingBottom: 16,
                            ),
                            previous_exports_widget()
                          ]))
                ],
              ),
            ),
          ],
        ));
  }
}

class export_format extends StatelessWidget {
  final String? text1, text2;
  final bool? isSelected;
  const export_format({
    super.key,
    this.text1,
    this.text2,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isActive: isSelected ?? false,
          onTap: () {},
          iscircle: true,
          circleIconsize: 14,
          size: 18,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: text1 ?? 'JSON format ',
                size: 14,
                fontFamily: AppFonts.gilroyMedium,
              ),
              Expanded(
                child: MyText(
                  text: text2 ?? '(recommended for data portability)',
                  color: getTertiary(context),
                  size: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class twotexted_checkbox extends StatelessWidget {
  final String? text1, text2;
  final bool? isSelected;
  const twotexted_checkbox({
    super.key,
    this.text1,
    this.text2,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isActive: isSelected ?? false,
          onTap: () {},
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TwoTextedColumn(
          text1: text1 ?? 'Personal Information',
          text2: text2 ??
              'Profile details, contact information Account settings and preferences',
          size1: 14,
          size2: 11.5,
          fontFamily: AppFonts.gilroyBold,
          fontFamily2: AppFonts.gilroyMedium,
          color2: getTertiary(context),
        ))
      ],
    );
  }
}
