import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/screens/profile/subscription/subscription_info.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/button_container.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context: context, title: "News", centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  Expanded(
                      child: MyText(
                    text: 'Top Stories',
                    size: 16,
                    fontFamily: AppFonts.gilroyBold,
                  )),
                  buttonContainer(
                    text: 'Bookmarks',
                    borderColor: getSecondaryColor(context),
                    txtColor: getSecondaryColor(context),
                    radius: 6,
                    bgColor: ktransparent,
                  )
                ],
              ),
              CustomeContainer(
                radius: 12,
                color: getfillcolor(context),
              )
            ],
          ))
        ],
      ),
    );
  }
}
