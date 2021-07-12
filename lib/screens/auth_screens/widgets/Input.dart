import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final TextEditingController? controller;
  String label;
  String hint;
  Widget? suffixIcon;
  bool obscureText;

  Input({
    this.label = '',
    this.hint = '',
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String _value = '';

  String get value => _value;

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.white24,
        style: BorderStyle.solid,
        width: 1,
      ),
    );
    InputBorder borderFocused =
        border.copyWith(borderSide: BorderSide(color: Colors.white70));

    return TextField(
      controller: widget.controller,
      onChanged: (text) {
        setState(() {
          _value = text;
        });
      },
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.white70),
        suffixIcon: widget.suffixIcon,
        enabledBorder: border,
        focusedBorder: borderFocused,
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        hintStyle: TextStyle(color: Colors.white38),
      ),
    );
  }
}
