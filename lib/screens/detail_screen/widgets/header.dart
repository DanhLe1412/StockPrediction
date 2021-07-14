import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String symbol;

  const Header({Key? key, required this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          child: Image.asset('assets/images/user.png'),
          radius: 25,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(symbol.toUpperCase()),
              Text('Starbucks Coffee'),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
