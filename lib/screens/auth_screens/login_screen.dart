import 'package:flutter/material.dart';
import 'package:stock_prediction/common_widgets/CustomButton.dart';
import 'package:stock_prediction/constants.dart';
import 'package:stock_prediction/screens/auth_screens/auth_screen.dart';
import 'package:stock_prediction/screens/auth_screens/widgets/Input.dart';
import 'package:stock_prediction/screens/home_screen/home_screen.dart';
import 'package:stock_prediction/services/Auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;

  final AuthBase auth = Auth();

  void _submit() {
    try {
      auth.signInWithEmailAndPassword(_email, _password);
      Navigator.of(context).pushNamed(routes['home']!);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: 'Let\'s sign you in.',
      subtitle: 'Welcome back.\nYou\'ve been missed!',
      children: [
        Input(
          label: 'Email',
          hint: 'abc@gmail.com',
          controller: _emailController,
        ),
        SizedBox(height: 16),
        Input(
          obscureText: true,
          label: 'Password',
          controller: _passwordController,
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
        onPressed: _submit,
        text: 'Login',
        mode: 'light',
      ),
    );
  }
}
