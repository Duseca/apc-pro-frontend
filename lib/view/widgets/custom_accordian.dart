import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

class CustomAccordion extends StatefulWidget {
  final String? title, desc;
  const CustomAccordion({
    super.key,
    this.title,
    this.desc,
  });

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border(
        //     bottom: BorderSide(color: ktransparent),
        //     top: BorderSide(color: ktransparent)),
        borderRadius: BorderRadius.circular(11),
        color: _isOpen ? getfillcolor(context) : getfillcolor(context),
        //  border: Border.all(color: kbluewithopacity.withOpacity(0.5))
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: ktransparent,
        ),
        child: ExpansionTile(
          title: MyText(
              text: widget.title ?? "How do I book a service?",
              size: 16,
              weight: FontWeight.w400,
              color: getSecondaryColor(context)),
          backgroundColor: ktransparent,
          trailing: _isOpen
              ? Image.asset(
                  Assets.imagesRoundedplus,
                  width: 20,
                  color: getSecondaryColor(context),
                )
              : Image.asset(
                  Assets.imagesRoundedminus,
                  width: 20,
                  color: getSecondaryColor(context),
                ),
          // Icon(
          //   _isOpen ? Icons.remove : Icons.add,
          //   color: getSecondaryColor(context)
          // ),
          childrenPadding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: MyText(
                        text: widget.desc ??
                            'FieldNote supports various audio file formats including MP3, WAV, and M4A, ensuring versatility for users.',
                        size: 12,
                        weight: FontWeight.w400,
                        paddingBottom: 10,
                        color: getTertiary(context)),
                  )
                ],
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isOpen = expanded;
            });
          },
        ),
      ),
    );
  }
}

class CustomAccordion2 extends StatefulWidget {
  final String? title, desc;
  const CustomAccordion2({
    super.key,
    this.title,
    this.desc,
  });

  @override
  State<CustomAccordion2> createState() => _CustomAccordion2State();
}

class _CustomAccordion2State extends State<CustomAccordion2> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border(
        //     bottom: BorderSide(color: ktransparent),
        //     top: BorderSide(color: ktransparent)),
        borderRadius: BorderRadius.circular(11),
        color: _isOpen ? getfillcolor(context) : getfillcolor(context),
        //  border: Border.all(color: kbluewithopacity.withOpacity(0.5))
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: ktransparent,
        ),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                  text: widget.title ?? "Reflection & Learning",
                  size: 12,
                  fontFamily: AppFonts.gilroySemiBold,
                  paddingBottom: 4,
                  color: getSecondaryColor(context)),
              MyText(
                text:
                    'What did you learn from this experience? How did it contribute to your professional development?',
                size: 11,
                weight: FontWeight.w400,
                color: getTertiary(context),
              ),
            ],
          ),
          backgroundColor: ktransparent,
          // trailing: _isOpen
          //     ? Image.asset(
          //         Assets.imagesRoundedplus,
          //         width: 20,
          //         color: getSecondaryColor(context),
          //       )
          //     : Image.asset(
          //         Assets.imagesRoundedminus,
          //         width: 20,
          //         color: getSecondaryColor(context),
          //       ),
          trailing: Icon(
              _isOpen
                  ? Icons.keyboard_arrow_down_rounded
                  : Icons.keyboard_arrow_up_rounded,
              color: getSecondaryColor(context)),
          childrenPadding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: MyText(
                        paddingTop: 10,
                        paddingLeft: 10,
                        text: widget.desc ??
                            'Reflect on key learnings, skills developed, and how this experience contributes to your competency development.',
                        size: 15,
                        weight: FontWeight.w400,
                        paddingBottom: 12,
                        color: getTertiary(context)),
                  )
                ],
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isOpen = expanded;
            });
          },
        ),
      ),
    );
  }
}
