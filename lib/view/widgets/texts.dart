// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Texts extends StatelessWidget {
  final TextAlign? align;
  Texts({super.key, required this.children, this.align});
  List<InlineSpan> children;
  @override
  Widget build(BuildContext context) {
    return RichText(
     textAlign:align?? TextAlign.center,
      text: TextSpan(children: children));
  }
}