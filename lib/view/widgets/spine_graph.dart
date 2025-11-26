import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/consts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyChart extends StatefulWidget {
  const WeeklyChart({super.key});

  @override
  State<WeeklyChart> createState() => _WeeklyChartState();
}

class _WeeklyChartState extends State<WeeklyChart> with AutomaticKeepAliveClientMixin {
  late final List<_ChartData> data;
  bool _mounted = true;

  @override
  bool get wantKeepAlive => false; // Set to false to allow proper disposal

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('Mon', 40),
      _ChartData('Tue', 50),
      _ChartData('Wed', 35),
      _ChartData('Thu', 65),
      _ChartData('Fri', 85),
      _ChartData('Sat', 70),
      _ChartData('Sun', 55),
    ];
  }

  @override
  void dispose() {
    _mounted = false;
    // Add a small delay to ensure chart animations complete before disposal
    Future.delayed(Duration.zero, () {
      if (mounted) {
        setState(() {});
      }
    });
    super.dispose();
  }

  @override
  void deactivate() {
    _mounted = false;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    if (!_mounted) {
      return const SizedBox(height: 135);
    }

    return RepaintBoundary(
      child: SizedBox(
        height: 135,
        child: SfCartesianChart(
          key: const ValueKey('weekly_chart_widget'),
          enableAxisAnimation: false,
          plotAreaBorderWidth: 0,
          backgroundColor: Colors.transparent,

          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(
              color: getTertiary(context),
              fontSize: 12,
              fontFamily: AppFonts.gilroyMedium,
            ),
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
          ),

          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 100,
            interval: 20,
            labelStyle: TextStyle(
              color: getTertiary(context),
              fontFamily: AppFonts.gilroyMedium,
            ),
            majorGridLines: MajorGridLines(
              width: 1,
              color: getSecondaryColor(context).withOpacity(0.5),
            ),
            axisLine: const AxisLine(width: 0),
          ),

          series: <CartesianSeries<_ChartData, String>>[
            SplineAreaSeries<_ChartData, String>(
              animationDelay: 0,
              animationDuration: 0,
              dataSource: data,
              xValueMapper: (d, _) => d.day,
              yValueMapper: (d, _) => d.value,
              splineType: SplineType.natural,
              borderWidth: 0,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  getSecondaryColor(context).withOpacity(0.20),
                  getSecondaryColor(context).withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
            ),
            SplineSeries<_ChartData, String>(
              animationDelay: 0,
              animationDuration: 0,
              dataSource: data,
              xValueMapper: (d, _) => d.day,
              yValueMapper: (d, _) => d.value,
              color: getSecondaryColor(context),
              width: 2,
              splineType: SplineType.natural,
              markerSettings: MarkerSettings(
                isVisible: true,
                color: getSecondaryColor(context),
                borderColor: getSecondaryColor(context),
                height: 5,
                width: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  final String day;
  final double value;

  _ChartData(this.day, this.value);
}