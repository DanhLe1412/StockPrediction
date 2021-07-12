import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_prediction/common_widgets/row_stock.dart';

class RowStocks extends StatelessWidget {
  const RowStocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RowStock(
        stockId: 'sbux',
        brand: 'Starbucks',
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
    ],);
  }
}
