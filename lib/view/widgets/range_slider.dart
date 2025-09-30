import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionSilder extends StatefulWidget {
  final String? label; // Label for the range (e.g., "$" or "km")
  final double? min;
  final double? max;
  final String? unit; // "\$" or "km"
final String? i1,i2,i3;
  const QuestionSilder({
    super.key,
    this.label,
    this.min,
    this.max,
    this.unit, this.i1, this.i2, this.i3,
  });

  @override
  _QuestionSilderState createState() => _QuestionSilderState();
}

class _QuestionSilderState extends State<QuestionSilder> {
  double _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.min ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          height: 20,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 12.0,
              activeTrackColor: kblueBorder4,
              inactiveTrackColor:Color(0xff5576A7),
              thumbShape: _CustomThumbShape(),
            ),
            child: Slider(
              min: widget.min ?? 0.0,
              max: widget.max ?? 200.0,
              divisions: 200,
              value: _value,
              onChanged: (val) {
                setState(() {
                  _value = val;
                });
              },
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text:widget.i1?? '5',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 9,
              ),
              MyText(
                text:widget.i2?? '50',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 9,
              ),
              MyText(
                text:widget.i3?? '100',
                size: 12,
                fontFamily: AppFonts.gilroyMedium,
                paddingBottom: 9,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Custom Thumb with border + fill
class _CustomThumbShape extends RoundSliderThumbShape {
  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color =kblueBorder4
// thumb fill
      ..style = PaintingStyle.fill;

    final Paint border = Paint()
      ..color = Colors.white // border color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double radius =7.0;

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius, border);
  }
}
