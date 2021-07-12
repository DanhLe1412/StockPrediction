import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_prediction/common_widgets/CustomButton.dart';
import 'package:stock_prediction/screens/auth_screens/auth_screen.dart';
import 'package:stock_prediction/screens/auth_screens/widgets/Input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: 'Let\'s sign you in.',
      subtitle: 'Welcome back.\nYou\'ve been missed!',
      children: [
        Input(
          label: 'Email',
          hint: 'abc@gmail.com',
        ),
        SizedBox(height: 16),
        Input(
          label: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            icon: _showPassword
                ? Icon(Icons.visibility, color: Colors.white24)
                : Icon(Icons.visibility_off, color: Colors.white24),
          ),
        ),
      ],
      question: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
          ),
        ],
      ),
      button: CustomButton(
        onPressed: () {},
        text: 'Login',
        mode: 'light',
      ),
    );
  }
}
