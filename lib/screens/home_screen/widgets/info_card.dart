import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF1BBDE4),Color(0xFF82DB9D)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balances',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$7.666.46',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.help_rounded,
                        color: Colors.white54,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '2.45%',
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 135,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                  elevation: MaterialStateProperty.all(0.5),
                  backgroundColor: MaterialStateProperty.all(Color(0xD3BDFCF0)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/crown.svg',
                      color: Colors.white,
                      width: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Pro account',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
