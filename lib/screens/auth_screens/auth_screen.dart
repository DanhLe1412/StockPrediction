import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_prediction/constants.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.question,
      required this.button,
      required this.children})
      : super(key: key);
  final String title;
  final String subtitle;
  final Widget question;
  final Widget button;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final bool isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(10),
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/images/left.svg',
                          width: 40,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 40),
                    ...children,
                    SizedBox(height: 24),
                    SizedBox(width: double.infinity, child: button),
                    isKeyBoardOpen ? SizedBox(height: 32) : Spacer(),
                    question,
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
