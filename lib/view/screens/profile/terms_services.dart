import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/bullet_points.dart';
import 'package:apc_pro/view/widgets/expanded_row.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context, title: 'Terms & Conditions', centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                physics: const BouncingScrollPhysics(),
                children: [
                  TwoTextedColumn(
                    text1: 'Introduction',
                    text2:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    size1: 16,
                    size2: 12,
                    color1: kwhite,
                    color2: kwhite,
                    fontFamily: AppFonts.gilroyBold,
                    weight2: FontWeight.normal,
                    mBottom: 10,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyBullet(
                    point:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    size: 12,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyBullet(
                    point:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    size: 12,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyBullet(
                    point:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    size: 12,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TwoTextedColumn(
                    text1: 'Information we collect',
                    text2:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    size1: 16,
                    size2: 12,
                    color1: kwhite,
                    color2: kwhite,
                    fontFamily: AppFonts.gilroyBold,
                    weight2: FontWeight.normal,
                    mBottom: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
