import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/bottom_half.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/line_chart_custom.dart';
import 'package:stock_prediction/screens/detail_screen/widgets/top_half.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class Stock {
  final String symbol;
  final int timestamp;
  final List<dynamic> timestamps;
  final List<dynamic> prices;

  Stock({
    required this.timestamp,
    required this.symbol,
    required this.timestamps,
    required this.prices,
  });

  factory Stock.fromJson(timestamp, symbol, timestamps, indicators) {
    return Stock(
        timestamp: timestamp,
        symbol: symbol,
        timestamps: timestamps,
        prices: indicators);
  }
}

class _DetailScreenState extends State<DetailScreen> {
  List<dynamic> _stocks = [];
  final List<FlSpot>? spots = [];

  void getAAPLStock() {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        FirebaseFirestore.instance
            .collection('stock')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          snapshot.docs.forEach((document) async {
            if (_stocks.isEmpty) {
              _stocks.add(Stock(
                timestamp: document.data()['timestamp'],
                prices: document.data()['prices'],
                timestamps: document.data()['timestamps'],
                symbol: document.data()['stockId'],
              ));
              if (DateTime.now().hour -
                      DateTime.fromMillisecondsSinceEpoch(_stocks[0].timestamp)
                          .hour >=
                  1) {
                await callApi();
                getAAPLStock();
              }

              int temp = _stocks[0].timestamps.length ~/ 10;
              double maxY = 0;
              double minX = _stocks[0].timestamps[0].toDouble() * 10;
              double minY = _stocks[0].prices[0].toDouble() * 10000;

              for (int i = 0; i < _stocks[0].timestamps.length ~/ temp; ++i) {
                double x = _stocks[0].timestamps[i].toDouble();
                double y = _stocks[0].prices[i].toDouble();
                if (y > maxY) maxY = y;
                if (minX > x) minX = x;
                if (minY > y) minY = y;
              }

              for (int i = 0; i < _stocks[0].timestamps.length ~/ temp; ++i) {
                double x = (_stocks[0].timestamps[i].toDouble() - minX) / 300;
                double y = _stocks[0].prices[i] % minY;
                spots?.add(FlSpot(x, y));
              }
              setState(() {});
            }
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getAAPLStock();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// top
                    TopHalf(
                      symbol: _stocks.isNotEmpty ? _stocks[0]?.symbol : '',
                      spots: spots,
                    ),
                    SizedBox(height: 40),

                    /// bottom
                    BottomHalf(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DocumentReference> callApi() async {
    print('calling api');
    // call api for 1 just for one : aapl
    Future.delayed(Duration(hours: 1), () {
      callApi();
    });
    final response = await http.get(
      Uri.https(
          'apidojo-yahoo-finance-v1.p.rapidapi.com',
          '/stock/v2/get-chart',
          {'interval': '5m', 'symbol': 'AAPL', 'range': '1d', 'region': 'US'}),
      headers: {
        'x-rapidapi-key': 'b33f1a6decmsh753b2c3ed2bde62p187d7cjsnce0e1e090a5b',
        'x-rapidapi-host': 'apidojo-yahoo-finance-v1.p.rapidapi.com'
      },
    );
    final data = jsonDecode(response.body);
    // var symbol = data['chart']['result'][0]['meta']['symbol'];
    var timestamp = data['chart']['result'][0]['timestamp'];
    var indicators =
        data['chart']['result'][0]['indicators']['quote'][0]['open'];

    return await FirebaseFirestore.instance.collection('stock').add({
      'stockId': 'AAPL',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'timestamps': timestamp,
      'prices': indicators,
    });
  }
}
