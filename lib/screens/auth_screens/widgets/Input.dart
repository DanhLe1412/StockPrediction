import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef validationCallback = void Function(String a);

class Input extends StatefulWidget {
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String label;
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final validationCallback? onChanged;
  final String? errorText;

  Input({
    this.errorText,
    this.onChanged,
    this.onEditingComplete,
    this.textInputAction,
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

    InputBorder errorBorder =
        border.copyWith(borderSide: BorderSide(color: Colors.red));

    return TextField(
      onEditingComplete: widget.onEditingComplete,
      controller: widget.controller,
      onChanged: (text) {
        setState(() {
          _value = text;
        });
        if (widget.onChanged != null) widget.onChanged!(_value);
      },
      obscureText: widget.obscureText,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        errorText: widget.errorText == '' ? null : widget.errorText,
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.white70),
        suffixIcon: widget.suffixIcon,
        enabledBorder: border,
        focusedBorder: borderFocused,
        focusedErrorBorder: errorBorder,
        errorBorder: errorBorder,
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        hintStyle: TextStyle(color: Colors.white38),
      ),
    );
  }
}
