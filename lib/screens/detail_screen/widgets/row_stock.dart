import 'package:flutter/material.dart';

class RowStock extends StatelessWidget {
  const RowStock(
      {Key? key,
      this.topText = '',
      this.bottomText = '',
      this.rightText = ''})
      : super(key: key);
  final String topText;
  final String bottomText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topText,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Text(
              bottomText,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Text(
          rightText,
          style: TextStyle(
            color: Color(0xFF31D8FF),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
