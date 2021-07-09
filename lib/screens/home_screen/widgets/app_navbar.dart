import 'package:flutter/material.dart';

class AppNavbar extends StatefulWidget {
  const AppNavbar({Key? key}) : super(key: key);

  @override
  _AppNavbarState createState() => _AppNavbarState();
}

class _AppNavbarState extends State<AppNavbar> {
  int _currentIndex = 0;

  Widget _attachIcon(IconData icon, int index) {
    if (index == _currentIndex) {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Icon(icon),
          Positioned(
            bottom: -4,
            child: Container(
              width: 6,
              height: 3,
              decoration: BoxDecoration(
                color: Color(0xFF31D8FF),
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF51DDFD),
                    blurRadius: 13,
                    spreadRadius: -8,
                    offset: Offset(0, -10),
                  ),
                ],
              ),
            ),
          ),
        ],
        clipBehavior: Clip.none,
      );
    } else {
      return Icon(
        icon,
        color: Colors.white38,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (int i) {
        setState(() {
          _currentIndex = i;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Transform(
              transform: Matrix4.translationValues(0, 10, 0),
              child: _attachIcon(Icons.home, 0)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Transform(
              transform: Matrix4.translationValues(0, 10, 0),
              child: _attachIcon(Icons.import_export, 1)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Transform(
              transform: Matrix4.translationValues(0, 10, 0),
              child: _attachIcon(Icons.schedule, 2)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Transform(
              transform: Matrix4.translationValues(0, 10, 0),
              child: _attachIcon(Icons.settings, 3)),
          label: '',
        ),
      ],
    );
  }
}
