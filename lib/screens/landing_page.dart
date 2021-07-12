import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_prediction/common_widgets/CustomButton.dart';
import 'package:stock_prediction/constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  @override
  Widget build(BuildContext context) {
    if (_user == null)
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: horizontalPadding,
          ),
          child: Column(
            children: [
              Image.asset('assets/images/login_image.png'),

              /// TODO change the font-family
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Stock Stock Stock Stock Stock',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget purus ac ex eleifend eleifend eget sit amet magna. Nam faucibus quam iaculis aliquam ultrices.',
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF3B3A42),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        text: 'Register',
                        mode: 'light',
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_in');
                        },
                        text: 'Sign In',
                        mode: 'dark',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      );
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
