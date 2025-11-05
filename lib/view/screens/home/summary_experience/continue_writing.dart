import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';
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
                  () => TabsWidget(
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
    
 final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return CustomeContainer(
      mbott: 19,
      radius: 10,
      hpad: 17,
      vpad: 17,
      color: getfillcolor(context),
      widget: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _expanded.toggle(),
              child: MyText(
                text: heading ?? 'Ethics, Roles of Conduct and Professionalism',
                size: 14,
                fontFamily: AppFonts.gilroyBold,
              ),
            ),
            const SizedBox(height: 20),
            ExpandedRow(
              text1: 'Progress: 0%',
              text2: 'Words: 0',
              color1: getTertiary(context),
              color2: getTertiary(context),
              fontFamily2: AppFonts.gilroyMedium,
              fontFamily: AppFonts.gilroyMedium,
            ),
            SizedBox(
              height: 10,
            ),
            linearProgressIndicatorr(
              height: 6,
              value: 0.0,
              bgColor: getfifth(context),
            ),
          if(_expanded.value==true)...{
            SizedBox(
              height: 12,
            ),
           
             
              _level_container(),
                 SizedBox(
              height: 12,
            ),
              _level_container(),
            
             
             SizedBox(height: 12),
              row_widget(
                icon: Assets.imagesBulb,
                iconColor: getSecondaryColor(context),
                title: 'AI Help',
                iconSize: 18,
                textColor: getSecondaryColor(context),
                fontFamily: AppFonts.gilroyMedium,
              ),
          }
            ],
        
        ),
      ),
    );
  }
}

class _level_container extends StatelessWidget {
  const _level_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 8,
      vpad: 12,
      hpad: 12,
      color: getfifth(context),
      widget: Row(
        children: [
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  
                  text: 'Level 1',
                  size: 12,
                  fontFamily: AppFonts.gilroyMedium,
                  paddingBottom: 3,
                  
                ),
                  MyText(
            text:
                'Demonstrate Knowledge and understanding of principles.........',
            size: 12,
         color: getTertiary(context),
           
          ),
              ],
            ),
          ),
        
       SizedBox(width: 12,),
                MyText(
                  color: getTertiary(context),
                  text: '0 Words',
                  size: 12,
                  fontFamily: AppFonts.gilroyMedium,
                
                ),
        ],
      ),
    );
  }
}
