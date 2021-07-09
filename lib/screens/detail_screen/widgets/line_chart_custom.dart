

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCustom extends StatelessWidget {
  const LineChartCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor:
        Theme.of(context).primaryColor,
        gridData: FlGridData(
          horizontalInterval: 20,
          getDrawingHorizontalLine: (_) =>
              FlLine(
                color: Colors.white12,
                strokeWidth: 0.5,
              ),
          drawVerticalLine: true,
          verticalInterval: 20,
          getDrawingVerticalLine: (_) =>
              FlLine(
                color: Colors.white12,
                strokeWidth: 0.5,
              ),
        ),
        titlesData: FlTitlesData(
          leftTitles:
          SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (double i) =>
            'Hello $i',
            interval: 30,
            getTextStyles: (_) => TextStyle(
                color: Colors.white),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            colors: [Color(0xFF31D8FF)],
            spots: [
              FlSpot(0, 0),
              FlSpot(70, 50),
              FlSpot(100, 100),
            ],
          ),

          /// green is predicted
          LineChartBarData(
            colors: [Color(0xFFA6EB92)],
            spots: [
              FlSpot(0, 0),
              FlSpot(100, 100),
            ],
          ),
        ],
      ),
    );
  }
}
