import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCustom extends StatefulWidget {
  final List<FlSpot>? spots;

  LineChartCustom({Key? key, this.spots}) : super(key: key);

  @override
  _LineChartCustomState createState() => _LineChartCustomState();
}

class _LineChartCustomState extends State<LineChartCustom> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Theme.of(context).primaryColor,
        gridData: FlGridData(
          drawVerticalLine: false,
          drawHorizontalLine: false,
        ),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(showTitles: false),
        ),
        minX: 0,
        minY: 0,
        maxX: 10,
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            colors: [Color(0xFF31D8FF)],
            spots: widget.spots != null && widget.spots!.isNotEmpty
                ? widget.spots
                : [FlSpot(0, 0)],
          ),

          /// green is predicted
          LineChartBarData(
            colors: [Color(0xFFA6EB92)],
            spots: [FlSpot(0, 0)],
          ),
        ],
      ),
    );
  }
}
