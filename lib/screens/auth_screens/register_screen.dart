import 'package:flutter/material.dart';
import 'package:stock_prediction/common_widgets/CustomButton.dart';
import 'package:stock_prediction/screens/auth_screens/auth_screen.dart';
import 'package:stock_prediction/screens/auth_screens/widgets/Input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;
  bool _show2ndPassword = false;

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: 'Let\'s register.',
      subtitle: 'Welcome to Stock Prediction!',
      children: [
        Input(
          label: 'Email',
          hint: 'abc@gmail.com',
        ),
        SizedBox(height: 16),
        Input(
          label: 'Password',
          obscureText: true,
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
        SizedBox(height: 16),
        Input(
          label: 'Input your password again',
          obscureText: true,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _show2ndPassword = !_show2ndPassword;
              });
            },
            icon: _show2ndPassword
                ? Icon(Icons.visibility, color: Colors.white24)
                : Icon(Icons.visibility_off, color: Colors.white24),
          ),
        ),
      ],
      question: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/sign_in');
            },
          ),
        ],
      ),
      button: CustomButton(
        onPressed: () {},
        text: 'Register',
        mode: 'light',
      ),
    );
  }
}
