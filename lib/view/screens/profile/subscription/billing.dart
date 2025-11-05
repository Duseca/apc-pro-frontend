import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custom_check_box.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCheckBox(
                                  isActive: true,
                                  onTap: () {},
                                  iscircle: true,
                                  circleIconsize: 14,
                                  size: 18,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: 'JSON format ',
                                        size: 14,
                                        fontFamily: AppFonts.gilroyMedium,
                                      ),
                                      Expanded(
                                        child: MyText(
                                          text:
                                              '(recommended for data portability)',
                                          color: getTertiary(context),
                                          size: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]))
                ],
              ),
            ),
          ],
        ));
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
