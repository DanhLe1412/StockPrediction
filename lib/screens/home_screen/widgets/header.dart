import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Morning',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 4),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white24,
                  size: 12,
                ),
                SizedBox(width: 8),
                Text(
                  'January 10, 2021',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ],
        ),
        CircleAvatar(
          child: Image.asset('assets/images/user.png'),
          radius: 25,
        ),
      ],
    );
  }
}
