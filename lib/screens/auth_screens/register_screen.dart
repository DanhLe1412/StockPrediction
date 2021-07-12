import 'package:flutter/material.dart';
import 'package:stock_prediction/common_widgets/CustomButton.dart';
import 'package:stock_prediction/screens/auth_screens/auth_screen.dart';
import 'package:stock_prediction/screens/auth_screens/widgets/Input.dart';
import 'package:stock_prediction/services/Auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = true;
  bool _show2ndPassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _2ndPasswordController = TextEditingController();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;

  String get _2ndPassword => _2ndPasswordController.text;

  final AuthBase auth = Auth();

  void _submit() {
    try {
      if (_password == _2ndPassword) {
        auth.createUserWithEmailAndPassword(_email, _password);
        Navigator.of(context).pop();
      }
    } catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: 'Let\'s register.',
      subtitle: 'Welcome to Stock Prediction!',
      children: [
        Input(
          label: 'Email',
          hint: 'abc@gmail.com',
          controller: _emailController,
        ),
        SizedBox(height: 16),
        Input(
          label: 'Password',
          controller: _passwordController,
          obscureText: _showPassword,
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
          controller: _2ndPasswordController,
          obscureText: _show2ndPassword,
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
        onPressed: _submit,
        text: 'Register',
        mode: 'light',
      ),
    );
  }
}
