import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

class ExpandableText extends StatefulWidget {
  final String text;
final Color?Readcolor;
  ExpandableText({
    required this.text, this.Readcolor,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: widget.text,
          color: kgrey,
          weight: FontWeight.w400,
          size: 14,
          // paddingBottom: 25,
          lineHeight: 1.7,
          maxLines: !_isExpanded ? 5 : 25,
          textOverflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: MyText(
            text: !_isExpanded ? "read more" : "read less",
            size: 14,
            color:widget.Readcolor?? kheading,
            fontFamily: AppFonts.gilroyMedium,
          ),
        ),
      ],
    );
  }
}
