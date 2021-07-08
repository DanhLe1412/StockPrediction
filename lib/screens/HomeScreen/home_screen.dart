import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_prediction/screens/HomeScreen/widgets/header.dart';
import 'package:stock_prediction/screens/HomeScreen/widgets/info_card.dart';
import 'package:stock_prediction/screens/HomeScreen/widgets/row_stock.dart';
import 'package:stock_prediction/screens/HomeScreen/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SizedBox(height: 32),
                SearchBox(),
                SizedBox(height: 32),
                InfoCard(),
                SizedBox(height: 32),
                Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 26,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
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
                      SizedBox(height: 16),
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
                      SizedBox(height: 16),
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
                      SizedBox(height: 16),
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
                      SizedBox(height: 16),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
