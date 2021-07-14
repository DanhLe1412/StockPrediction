import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RowStock extends StatelessWidget {
  const RowStock(
      {Key? key,
      required this.stockId,
      required this.brand,
      this.spots,
      this.value,
      required this.changes})
      : super(key: key);
  final String stockId;
  final String brand;
  final List<FlSpot>? spots;
  final String? value;
  final String changes;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/stock_detail');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stockId.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    brand,
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
              _buildChart(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildStockValue(),
                  SizedBox(height: 4),
                  Text(
                    changes,
                    style: TextStyle(
                      color: Color(0xFF31D8FF),
                      fontSize: value != null ? 12 : 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStockValue() {
    return value != null
        ? Text(
            value!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        : SizedBox();
  }

  Widget _buildChart() {
    return spots != null && spots!.length > 0
        ? ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100, maxHeight: 50),
            child: LineChart(
              LineChartData(
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
                    spots: spots,
                    colors: [Color(0xFF31D8FF)],
                  ),
                ],
              ),
            ),
          )
        : Text('');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
