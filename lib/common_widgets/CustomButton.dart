import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.mode = 'light',
  }) : super(key: key);

  final String mode;
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color>? overlayColor =
        mode == 'light' ? MaterialStateProperty.all(Color(0x95C9C9C9)) : null;

    final MaterialStateProperty<Color> backgroundColor = mode == 'light'
        ? (onPressed != null
            ? MaterialStateProperty.all(Colors.white)
            : MaterialStateProperty.all(Colors.white38))
        : MaterialStateProperty.all(Color(0xFF3B3A42));
    final Color color = mode == 'light'
        ? (onPressed != null ? Colors.black : Colors.grey)
        : Colors.white;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
        elevation: MaterialStateProperty.all(0),
        overlayColor: overlayColor,
        backgroundColor: backgroundColor,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
