import 'package:flutter/material.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/bottom_half.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/top_half.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// top
                    TopHalf(),
                    SizedBox(height: 40),
                    /// bottom
                    BottomHalf(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
