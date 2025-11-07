import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:apc_pro/generated/assets.dart';
import 'package:apc_pro/view/widgets/custom_row.dart';
import 'package:apc_pro/view/widgets/custome_comtainer.dart';
import 'package:apc_pro/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWithTap extends StatefulWidget {
  const PieChartWithTap({super.key});

  @override
  State<PieChartWithTap> createState() => _PieChartWithTapState();
}

class _PieChartWithTapState extends State<PieChartWithTap> {
  final List<_ChartData> data = [
    _ChartData('Zone 3', 50, Color(0xffA3A3A4)),
    _ChartData('Zone 1', 25, Color(0xffEFB100)),
    _ChartData('Zone 2', 25, Color(0xffFB2C36)),
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      radius: 12,
      color: getfillcolor(context),
      vpad: 16,
      hpad: 14,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Coverage Overview',
            size: 16,
            fontFamily: AppFonts.gilroyBold,
          ),
          SizedBox(
            height: 230,
            child: Stack(
              children: [
                SfCircularChart(
                  tooltipBehavior: TooltipBehavior(
                      enable: true,
                      shadowColor: ktransparent,
                      borderColor: getSecondaryColor(context).withOpacity(0.4),
                      textStyle: TextStyle(color: getSecondaryColor(context)),
                      color: getfillcolor(
                        context,
                      )),
                  series: <CircularSeries<_ChartData, String>>[
                    DoughnutSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      pointColorMapper: (_ChartData data, _) => data.color,
                      onPointTap: (ChartPointDetails details) {
                        setState(() {
                          selectedIndex = details.pointIndex;
                        });
                      },
                      explode: true,
                      explodeAll: true,
                      explodeOffset: '0%',
                      // strokeWidth: 5,
                      innerRadius: '74%',
                    ),
                  ],
                  //  borderWidth: 40,
                  centerX: '50%',
                  centerY: '50%',
                ),
                Positioned(
            top: 50,
            left: 3,
            right: 3,
            bottom: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: '62',
                  size: 22,
                 fontFamily: AppFonts.gilroyBold,
                  color: getSecondaryColor(context),
                  paddingBottom: 6,
                ),
                MyText(
                  text: 'Total Competencies',
                  size: 10,
                  weight: FontWeight.w600,
                  paddingLeft: 4,
                  paddingRight: 4,
                  color: getSecondaryColor(context),
                )
              ],
            ),
          )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              row_widget(
                icon: Assets.imagesError,
                iconSize: 10,
                title: 'Refreshed (32)',
                textColor: getTertiary(context),
                texSize: 10,
                iconColor: getTertiary(context),
              ),
              row_widget(
                icon: Assets.imagesError,
                iconSize: 10,
                title: 'In Progress (18)',
                textColor: getTertiary(context),
                texSize: 10,
                iconColor: Color(0xffEFB100),
              ),
              row_widget(
                icon: Assets.imagesError,
                iconSize: 10,
                title: 'Not Started (12)',
                textColor: getTertiary(context),
                texSize: 10,
                iconColor: Color(0xffFB2C36),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;
  final Color color;

  _ChartData(this.x, this.y, this.color);
}



//////////pie2

class CircularProgressChart extends StatefulWidget {
  @override
  State<CircularProgressChart> createState() => _CircularProgressChartState();
}

class _CircularProgressChartState extends State<CircularProgressChart> {
  final List<_ChartData2> data2 = [
    _ChartData2('Zone 2', 60, Color(0xffF72805)),
    _ChartData2('Zone 1', 20, Color(0xffF6900D)),
    _ChartData2('Zone 3', 25, Color(0xff23923D)),
    _ChartData2('Zone 5', 18, Color(0xff3778CA)),
    _ChartData2('Zone 6', 14, Color(0xff7040EC)),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              height: 200,
              child: SfCircularChart(
                tooltipBehavior: TooltipBehavior(
                    enable: true,
                    shadowColor: ktransparent,
                    borderColor: getSecondaryColor(context).withOpacity(0.4),
                    textStyle: TextStyle(color: getSecondaryColor(context)),
                    color: getfillcolor(
                      context,
                    )),
                series: <CircularSeries<_ChartData2, String>>[
                  DoughnutSeries<_ChartData2, String>(
                    dataSource: data2,
                    xValueMapper: (_ChartData2 data2, _) => data2.x,
                    yValueMapper: (_ChartData2 data2, _) => data2.y,
                    pointColorMapper: (_ChartData2 data, _) => data.color,
                    startAngle: -120,
                    cornerStyle: CornerStyle.bothCurve,
                    endAngle: 120,
                    innerRadius: '88%',
                    onPointTap: (ChartPointDetails details) {
                      // setState(() {
                      //   selectedIndex = details.pointIndex;
                      // });
                    },
                    explode: true,
                    explodeAll: true,
                    explodeOffset: '3%',
                  ),
                ],
              )),
          Positioned(
            top: 50,
            left: 1,
            right: 1,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: getTertiary(context).withOpacity(0.15)),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  MyText(
                    text: '57',
                    size: 22,
                    weight: FontWeight.bold,
                    color: getSecondaryColor(context),
                    paddingBottom: 6,
                  ),
                  MyText(
                    text: 'Amazing',
                    size: 14,
                    weight: FontWeight.w600,
                    color: getSecondaryColor(context),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ChartData2 {
  final String x;
  final double y;
  final Color color;

  _ChartData2(this.x, this.y, this.color);
}
