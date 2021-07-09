import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Weekly';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropdownButton(
          value: dropdownValue,
          elevation: 2,
          icon: SizedBox(),
          dropdownColor: Color(0xFF1A1C1E),
          underline: SizedBox(),
          style: TextStyle(color: Colors.white54, fontSize: 12),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: ['Daily', 'Weekly', 'Monthly', 'Yearly'].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Container(
                height: 32,
                width: 80,
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1C1E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 16,
          right: 8,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white54,
            size: 14,
          ),
        ),
      ],
    );
  }
}
