import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:stock_prediction/common_widgets/CustomButton.dart';
import 'package:stock_prediction/constants.dart';
import 'package:stock_prediction/helpers.dart';
import 'package:stock_prediction/screens/auth_screens/auth_screen.dart';
import 'package:stock_prediction/screens/auth_screens/widgets/Input.dart';
import 'package:stock_prediction/services/Auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;
  bool _submitted = false;
  bool _submitEnabled = true;
  bool _isLoading = false;
  final AccountValidator validator = new AccountValidator();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;

  final AuthBase auth = Auth();

  Future<void> _submit() async {
    try {
      setState(() {
        _submitted = true;
        _isLoading = true;
      });
      if (validator.errs['email']!.isEmpty &&
          validator.errs['password']!.isEmpty) {
        await auth.signInWithEmailAndPassword(_email, _password);
        Navigator.of(context).pushReplacementNamed(routes['home']!);
      }
    } on FirebaseAuthException catch (e) {
      Alert(
        context: context,
        style: AlertStyle(
          titleStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
          descStyle: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        type: AlertType.error,
        title: e.code.toUpperCase(),
        desc: e.message,
      ).show();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_submitted)
      _submitEnabled = !_isLoading &&
          validator.errs['email']!.isEmpty &&
          validator.errs['password']!.isEmpty;
    return AuthScreen(
      title: 'Let\'s sign you in.',
      subtitle: 'Welcome back.\nYou\'ve been missed!',
      children: [
        Input(
          label: 'Email',
          onChanged: (String email) {
            validator.emailValidate(_email);
            setState(() {});
          },
          onEditingComplete: () {
            if (validator.errs['email']!.isEmpty) {
              _passwordFocusNode.requestFocus();
            } else _emailFocusNode.requestFocus();
          },
          focusNode: _emailFocusNode,
          errorText: _submitted ? validator.errs['email'] : null,
          hint: 'abc@gmail.com',
          controller: _emailController,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16),
        Input(
          obscureText: _hidePassword,
          focusNode: _passwordFocusNode,
          textInputAction: TextInputAction.done,
          onChanged: (String password) {
            validator.passwordValidate(_password);
            setState(() {});
          },
          errorText: _submitted ? validator.errs['password'] : null,
          onEditingComplete: _submit,
          label: 'Password',
          controller: _passwordController,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            icon: _hidePassword
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
        onPressed: _submitEnabled ? _submit : null,
        text: 'Login',
        mode: 'light',
      ),
    );
  }
}
