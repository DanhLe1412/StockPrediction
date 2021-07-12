import 'package:flutter/material.dart';
import 'package:stock_prediction/screens/auth_screens/register_screen.dart';
import 'package:stock_prediction/screens/auth_screens/login_screen.dart';
import 'package:stock_prediction/screens/detail_screen/detail_screen.dart';
import 'package:stock_prediction/screens/home_screen/home_screen.dart';
import 'package:stock_prediction/screens/landing_page.dart';

void main() {
  runApp(StockPrediction());
}

class StockPrediction extends StatelessWidget {
  const StockPrediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Prediction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF171719),
        appBarTheme: AppBarTheme(elevation: 0),
        scaffoldBackgroundColor: Color(0xFF171719),
        accentColor: Color(0xFF131215),
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      initialRoute: HomeScreen.route,
      routes: {
        '/': (_) => LandingPage(),
        '/stock_detail': (_) => DetailScreen(),
        '/sign_in': (_) => LoginScreen(),
        '/register': (_) => RegisterScreen(),
      },
    );
  }
}
