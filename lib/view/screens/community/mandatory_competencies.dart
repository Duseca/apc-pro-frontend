import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/community_widgets/community_main_widget.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class MandatoryCompetencies extends StatelessWidget {
  const MandatoryCompetencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Mandatory Competencies',
            centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              text:
                  'Discuss professional ethics, conduct, and communication required for APC.',
              size: 14,
              textAlign: TextAlign.center,
              fontFamily: AppFonts.gilroyMedium,
              paddingLeft: 5,
              paddingRight: 5,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  MyButton(
                    buttonText: ' Start new discussion',
                    image: Assets.imagesAdd,
                    imgColor: klighblue,
                    mBottom: 36,
                  ),
                  MyText(
                    text: '3245 members | 1325 posts | Active 2 minutes ago',
                    size: 15,
                    fontFamily: AppFonts.gilroyMedium,
                    color: klighblue,
                    paddingBottom: 15,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: community_recent_activity_card(
                          hasComments: true,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
