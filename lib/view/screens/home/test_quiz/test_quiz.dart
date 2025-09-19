import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class TestQuiz extends StatelessWidget {
  const TestQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackground,
        appBar: simpleAppBar(
            context: context,
            title: 'Test and Quiz',
            centerTitle: true,
            actions: [
              Bounce(
                  child: Image.asset(
                Assets.imagesBulb2,
                width: 24,
              )),
              SizedBox(
                width: 12,
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomeContainer(
                      radius: 10,
                      borderColor: kblueBorder2,
                      vpad: 17,
                      hpad: 13,
                      widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Performance overview',
                              size: 14,
                              fontFamily: AppFonts.gilroyBold,
                              paddingBottom: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _performance_overview(),
                                _performance_overview(
                                  icon: Assets.imagesMessg,
                                  text2: 'Questions\nAnswered',
                                ),
                                _performance_overview(
                                  text2: '1 Day',
                                ),
                                _performance_overview(
                                  text2: '+12%\nImprovementRate',
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

class _performance_overview extends StatelessWidget {
  final String? text1, text2, icon;
  const _performance_overview({
    super.key,
    this.text1,
    this.text2,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: ksecondary,
          child: Center(
            child: icon != null
                ? Image.asset(
                    icon ?? Assets.imagesMessg,
                    width: 24,
                  )
                : MyText(
                    text:text1?? '82%',
                    size: 20,
                    fontFamily: AppFonts.gilroyBold,
                  ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 70, 
          child: MyText(
            text: text2 ?? 'Avrg score',
            size: 12,
            textAlign: TextAlign.center,
            fontFamily: AppFonts.gilroyMedium,
          ),
        ),
      ],
    );
  }
}
