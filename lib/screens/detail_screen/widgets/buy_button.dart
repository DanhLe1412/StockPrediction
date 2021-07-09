import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BuyButton extends StatefulWidget {
  const BuyButton({Key? key}) : super(key: key);

  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> with TickerProviderStateMixin {
  bool _toggle = false;
  var _rotateTween = Tween<double>(begin: 0, end: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggle = true;
          _rotateTween = Tween<double>(begin: 0, end: pi);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        height: 46,
        width: 100,
        decoration: BoxDecoration(
          color: _toggle ? Color(0xFF6FE0FA) : Color(0xFF131215),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AnimatedPositioned(
              left: _toggle ? 56 : 4,
              duration: Duration(milliseconds: 400),
              child: TweenAnimationBuilder(
                tween: _rotateTween,
                duration: Duration(milliseconds: 400),
                builder: (_, double angle, Widget? child) {
                  return Transform.rotate(
                    angle: angle,
                    child: child,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xFF1BBDE4), Color(0xFF82DB9D)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 40,
                  width: 40,
                  child: Transform.rotate(
                    angle: pi,
                    child: Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            if (!_toggle)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                right: 18,
              )
            else
              Text(''),
          ],
        ),
      ),
    );
  }
}
