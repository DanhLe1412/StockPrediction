import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RowStock extends StatefulWidget {
  const RowStock(
      {Key? key,
      required this.stockId,
      required this.brand,
      required this.spots,
      required this.value,
      required this.changes})
      : super(key: key);
  final String stockId;
  final String brand;
  final List<FlSpot> spots;
  final String value;
  final String changes;

  @override
  _RowStockState createState() => _RowStockState();
}

class _RowStockState extends State<RowStock> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.stockId.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.brand,
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 100, maxHeight: 50),
          child: LineChart(
            LineChartData(
              maxX: 100,
              maxY: 100,
              gridData: FlGridData(
                drawHorizontalLine: false,
              ),
              titlesData: FlTitlesData(
                show: false,
              ),
              borderData: FlBorderData(show: false),
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  HorizontalLine(
                    color: Color(0x4031D8FF),
                    y: 50,
                  ),
                ],
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  dotData: FlDotData(show: false),
                  spots: widget.spots,
                  colors: [Color(0xFF31D8FF)],
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.changes,
              style: TextStyle(
                color: Color(0xFF31D8FF),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
