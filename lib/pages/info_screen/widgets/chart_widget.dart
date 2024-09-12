import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/calculate.dart';

class MyBarchart extends StatelessWidget {
  const MyBarchart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: getBottomTitles))),
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(toY: Calculate().pYear()),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(toY: Calculate().dyear(), color: Colors.amber),
            ],
          ),
        ],
        borderData: FlBorderData(show: false),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  
  const style = TextStyle(
    color: Colors.purple,
    fontSize: 10.5,
    fontWeight: FontWeight.bold,
  );

  Widget text;
  switch (value.toInt()) {
    case 1:
      text =  Text(
        'پرداختی امسال'.tr,
        style: style,
      );
      break;
    case 2:
      text =  Text(
        'دریافتی امسال'.tr,
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
