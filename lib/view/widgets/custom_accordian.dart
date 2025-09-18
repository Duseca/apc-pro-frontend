import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';

class CustomAccordion extends StatefulWidget {
  final String? title, desc;
  const CustomAccordion({
    Key? key,
    this.title,
    this.desc,
  }) : super(key: key);

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
        // borderRadius: BorderRadius.circular(12),
        color: _isOpen ? kwhite : kwhite,
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
            color: kheading,
          ),
          backgroundColor: ktransparent,
          trailing: Icon(
            _isOpen ? Icons.remove : Icons.add,
            color: kheading,
          ),
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
                            'Go to the provider’s profile, check their availability, and tap the “Book Service” button to confirm your appointment.',
                        size: 14,
                        weight: FontWeight.w300,
                        color: kgrey),
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
