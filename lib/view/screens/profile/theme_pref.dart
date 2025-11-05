import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ThemePref extends StatelessWidget {
  const ThemePref({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(
            context: context,
            title: 'Theme Preferences',
            centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [],
              ),
            ),
          ],
        ));
  }
}
