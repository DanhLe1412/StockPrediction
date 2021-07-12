import 'package:flutter/material.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/buy_button.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/drop_down.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/row_stock.dart';

class BottomHalf extends StatefulWidget {
  const BottomHalf({Key? key}) : super(key: key);

  @override
  _BottomHalfState createState() => _BottomHalfState();
}

class _BottomHalfState extends State<BottomHalf> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Summary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropDown(),
            ],
          ),
          SizedBox(height: 32),
          Column(
            children: [
              RowStock(
                topText: 'Days open',
                bottomText: '\$136.28',
                rightText: '+2,94',
              ),
              SizedBox(height: 24),
              RowStock(
                topText: 'Closing price',
                bottomText: 'SBUX',
                rightText: '+0,79',
              ),
            ],
          ),
          SizedBox(height: 32),
          BuyButton(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
