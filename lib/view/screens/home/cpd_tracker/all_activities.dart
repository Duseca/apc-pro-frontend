import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/screens/home/cpd_tracker/cpd_tracker.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:flutter/material.dart';

class AllActivities extends StatelessWidget {
  const AllActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
          context: context, title: 'All Activities', centerTitle: true),
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
                  widget: ListView.separated(
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(
                        color: getfifth(context),
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return recnet_activity_widget(
                        text2: 'RICS 15 Mar 2025  | 8 hrs',
                        text1: 'Technical Article Reading',
                      );
                    },
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
