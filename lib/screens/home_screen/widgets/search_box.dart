import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).accentColor,
      ),
      child: Center(
        child: IntrinsicWidth(
          child: TextField(
            textAlign: TextAlign.center,
            onChanged: (text) {
              setState(() {
                value = text;
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.white38),
              border: InputBorder.none,
              hintText: 'Search stocks',
              hintStyle: TextStyle(color: Colors.white38),
            ),
          ),
        ),
      ),
    );
  }
}
