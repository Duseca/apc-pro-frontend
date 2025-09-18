import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/progress_indicator.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ContinueWriting extends StatelessWidget {
  const ContinueWriting({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = [
      "Mandatory Competency",
      'Technical Competency',
    ];

    final List writing = [
      'Ethics, Roles of Conduct and Professionalism',
      'Communication and Negotiation',
      'Health and Safety',
      'Health and Accounting Principles and Procedures',
      'Accounting Principles and Procedures',
      'Business Planning',
      'Data Management'
    ];
    
  final RxInt currentIndex = 0.obs;

    return Scaffold(
      backgroundColor: kbackground,
      appBar: simpleAppBar(
        context: context,
        title: 'Continue Writing',
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Obx(
                ()=> TabsWidget(
                      items: _tabs,
                      currentindex: currentIndex.value,
                      ontap: (p0) {
                        currentIndex.value = p0; 
                      },
                    ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: writing.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: ContinueWritingContainer(
                        heading: writing[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueWritingContainer extends StatelessWidget {
  final String? heading;
  final RxBool _expanded = false.obs; // reactive state

  ContinueWritingContainer({super.key, this.heading});

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      mbott: 19,
      radius: 10,
      hpad: 17,
      vpad: 17,
      color: kblackfill,
      borderColor: kblueBorder3,
      widget: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _expanded.toggle(),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: heading ??
                          'Ethics, Roles of Conduct and Professionalism',
                      size: 14,
                      fontFamily: AppFonts.gilroyBold,
                    ),
                  ),
                  Icon(
                    _expanded.value
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: ksecondary,
                    size: 22,
                  ),
                ],
              ),
            ),
           
              const SizedBox(height: 20),
              MyText(
                text: 'Progress: 0%   Words: 0',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 8,
              ),
              linearProgressIndicatorr(),
               if (_expanded.value) ...[
              const SizedBox(height: 13),
              Row(
                children: [
                  buttonContainer(
                    borderColor: kblueBorder2,
                    radius: 50,
                    text: 'Level 1',
                    bgColor: kblackfill,
                    textsize: 11,
                    vPadding: 2,
                    hPadding: 15,
                  ),
                ],
              ),
              MyText(
                paddingTop: 13,
                text: '0 Words',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 13,
              ),
              MyText(
                text:
                    'Demonstrate Knowledge and understanding of principles.........',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 8,
              ),
              Row(
                children: [
                  buttonContainer(
                    borderColor: kblueBorder2,
                    radius: 50,
                    text: 'Level 2',
                    bgColor: kblackfill,
                    textsize: 11,
                    vPadding: 2,
                    hPadding: 15,
                  ),
                ],
              ),
              MyText(
                paddingTop: 13,
                text: '0 Words',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 13,
              ),
              MyText(
                text: 'Show practical application of knowledge....',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 8,
              ),
              const Divider(color: kblueBorder3),
              const SizedBox(height: 13),
              row_widget(
                icon: Assets.imagesBulb,
                title: 'AI Help',
                iconSize: 18,
                textColor: const Color(0xff5796FF),
                fontFamily: AppFonts.gilroyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
