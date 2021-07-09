

import 'package:flutter/material.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/header.dart';

import 'package:stock_prediction/screens/detail_screen/widgets/line_chart_custom.dart';

class TopHalf extends StatefulWidget {
  const TopHalf({Key? key}) : super(key: key);

  @override
  _TopHalfState createState() => _TopHalfState();
}

class _TopHalfState extends State<TopHalf> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 24, horizontal: 16),
        color: Color(0xFF131215),
        child: Column(
          children: [
            Column(
              children: [
                Header(),
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 250,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: LineChartCustom(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
