

import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CountdownGauge extends StatelessWidget {
  final int hours;
  final int minutes;

  const CountdownGauge({super.key, required this.hours, required this.minutes});

  int get totalMinutes => hours * 60 + minutes;

  @override
  Widget build(BuildContext context) {
    double percentage = totalMinutes / (12 * 60);

    return Stack(
      alignment: Alignment.center,
      children: [
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 260,
              endAngle: 260,
              radiusFactor: 0.9,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: kgrey,
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: percentage * 99,
                  width: 0.18,
                  color: ksecondary,
                  cornerStyle: CornerStyle.bothCurve,
                  sizeUnit: GaugeSizeUnit.factor,
                  enableAnimation: true,
                  animationType: AnimationType.easeInCirc,
                  animationDuration: 800,
                ),
                MarkerPointer(
                  value: percentage * -180,
                  markerType: MarkerType.circle,
                  color: ksecondary,
                  borderColor:kblueBorder,
                  borderWidth: 1,
                  markerWidth: 14,
                  markerHeight: 14,
                  markerOffset: 3,
                ),
                MarkerPointer(
                  value: percentage * 95,
                  markerOffset: 4,
                  markerType: MarkerType.circle,
                  color: kwhite,
                  borderColor: ksecondary,
                  borderWidth: 1,
                  markerWidth: 14,
                  markerHeight: 14,
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText(
              text:
                  '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}',
              size: 36,
              fontFamily: AppFonts.gilroyMedium,
            ),
            MyText(
              text: 'Hours remaining',
              color: kwhite,
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}
