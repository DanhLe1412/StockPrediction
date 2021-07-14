import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_prediction/constants.dart';
import 'package:stock_prediction/screens/auth_screens/register_screen.dart';
import 'package:stock_prediction/screens/auth_screens/login_screen.dart';
import 'package:stock_prediction/screens/detail_screen/detail_screen.dart';
import 'package:stock_prediction/screens/home_screen/home_screen.dart';
import 'package:stock_prediction/screens/landing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Stock {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  // requestStockIfNotYet();
  runApp(StockPrediction());
}

class StockPrediction extends StatelessWidget {
  StockPrediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
      initialRoute: routes['initialRoute'],
      routes: {
        routes['initialRoute']!: (_) => LandingPage(),
        routes['landing_page']!: (_) => LandingPage(),
        routes['home']!: (_) => HomeScreen(),
        routes['stock_detail']!: (_) => DetailScreen(),
        routes['sign_in']!: (_) => LoginScreen(),
        routes['register']!: (_) => RegisterScreen(),
      },
    );
  }
}
