import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';

class PriceRangeSlider extends StatefulWidget {
  final String? label; // Label for the range (e.g., "$" or "km")
  final double? min;
  final double? max;
  final String? unit; // "\$" or "km"

  const PriceRangeSlider({
    super.key,
    this.label,
  this.min,
     this.max,
    this.unit,
  });

  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
   double? _lowerValue;
  double? _upperValue;

  @override
  void initState() {
    super.initState();
    _lowerValue = widget.min??0;
    _upperValue = widget.max??200;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Adjust alignment based on unit (\$ or km)
              MyText(
                text: widget.unit == "\$"
                    ? "\$${_lowerValue?.toStringAsFixed(0)}"
                    : "${_lowerValue?.toStringAsFixed(0)} ${widget.label}",
                color: ksecondary,
                size: 11,
                fontFamily: AppFonts.gilroyMedium,
                textAlign: widget.unit == "\$" ? TextAlign.left : TextAlign.right, // Left for \$, right for km
              ),
              MyText(
                text: widget.unit == "\$"
                    ? "\$${_upperValue?.toStringAsFixed(0)}"
                    : "${_upperValue?.toStringAsFixed(0)} ${widget.label}",
                color: ksecondary,
                size: 11,
                fontFamily: AppFonts.gilroyMedium,
                textAlign: widget.unit == "\$" ? TextAlign.left : TextAlign.right, // Left for \$, right for km
              ),
            ],
          ),
        ),
        SizedBox(
          width: Get.width,
          height: 30, // Thicker slider height
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: ksecondary,
              trackHeight: 8.0, // Thicker track
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 15.0, // Make the thumb bigger
                elevation: 4, // Add shadow to the thumb
                disabledThumbRadius: 12.0,
                pressedElevation: 8,
              ),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0), // Thumb overlay size
              activeTrackColor: ksecondary, // Active track color
              inactiveTrackColor: ksecondary.withOpacity(0.2), // Inactive track color
            ),
            child: RangeSlider(
              min: widget.min??0.0,
              max: widget.max??200.0,
              divisions: 200,
              values: RangeValues(_lowerValue!, _upperValue!),
              onChanged: (RangeValues values) {
                setState(() {
                  _lowerValue = values.start;
                  _upperValue = values.end;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
