import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_prediction/common_widgets/row_stock.dart';

class RowStocks extends StatelessWidget {
  RowStocks({Key? key}) : super(key: key);


  final List<Widget> rowStocks = [
    RowStock(
      stockId: 'aapl',
      brand: 'Apple Inc.',
      spots: [
        FlSpot(0, 40),
        FlSpot(10, 15),
        FlSpot(20, 35),
        FlSpot(30, 33),
        FlSpot(40, 55),
        FlSpot(50, 45),
        FlSpot(60, 55),
        FlSpot(67, 54),
        FlSpot(80, 80),
        FlSpot(90, 70),
        FlSpot(100, 82),
      ],
      value: '780,64',
      changes: '+0.20',
    ),
    RowStock(
      stockId: 'sbux',
      brand: 'Starbucks',
      spots: [
        FlSpot(1626164100, 4.41),
        FlSpot(1626164400, 4.45),
        FlSpot(1626172500, 4.45),
        FlSpot(1626174000, 4.45),
        FlSpot(1626174300, 4.44),
        FlSpot(1626176100, 4.48),
        FlSpot(1626177600, 4.46),
        FlSpot(1626179100, 4.48),
        FlSpot(1626179400, 4.46),
        FlSpot(1626179700, 4.47),
        FlSpot(1626180000, 4.45),
      ],
      value: '780,64',
      changes: '+0.20',
    ),
    RowStock(
      stockId: 'aapl',
      brand: 'Apple Inc.',
      spots: [
        FlSpot(0, 40),
        FlSpot(10, 15),
        FlSpot(20, 35),
        FlSpot(30, 33),
        FlSpot(40, 55),
        FlSpot(50, 45),
        FlSpot(60, 55),
        FlSpot(67, 54),
        FlSpot(80, 80),
        FlSpot(90, 70),
        FlSpot(100, 82),
      ],
      value: '780,64',
      changes: '+0.20',
    ),
    RowStock(
      stockId: 'aapl',
      brand: 'Apple Inc.',
      spots: [
        FlSpot(0, 40),
        FlSpot(10, 15),
        FlSpot(20, 35),
        FlSpot(30, 33),
        FlSpot(40, 55),
        FlSpot(50, 45),
        FlSpot(60, 55),
        FlSpot(67, 54),
        FlSpot(80, 80),
        FlSpot(90, 70),
        FlSpot(100, 82),
      ],
      value: '780,64',
      changes: '+0.20',
    ),
    RowStock(
      stockId: 'aapl',
      brand: 'Apple Inc.',
      spots: [
        FlSpot(0, 40),
        FlSpot(10, 15),
        FlSpot(20, 35),
        FlSpot(30, 33),
        FlSpot(40, 55),
        FlSpot(50, 45),
        FlSpot(60, 55),
        FlSpot(67, 54),
        FlSpot(80, 80),
        FlSpot(90, 70),
        FlSpot(100, 82),
      ],
      value: '780,64',
      changes: '+0.20',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rowStocks,
    );
  }
}
