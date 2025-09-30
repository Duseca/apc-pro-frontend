import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:apc_pro/view/widgets/star_ratings.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            simpleAppBar(context: context, title: 'Review', centerTitle: true),
        backgroundColor: kbackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                      child: MyText(
                    text: 'Rate our App',
                    size: 22,
                    fontFamily: AppFonts.gilroyBold,
                    paddingBottom: 18,
                  )),
                  Center(
                      child: StarRating(
                    rating: 5,
                    size: 25,
                  )),
                  SizedBox(
                    height: 51,
                  ),
                  MyTextField(
                    label: 'Your experience with APC Pro ',
                    hint: 'Enter your feedback here',
                    maxLines: 4,
                    bordercolor: ksecondary,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
