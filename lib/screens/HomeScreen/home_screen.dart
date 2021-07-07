import 'package:flutter/material.dart';
import 'package:stock_prediction/screens/HomeScreen/widgets/header.dart';
import 'package:stock_prediction/screens/HomeScreen/widgets/info_card.dart';
import 'package:stock_prediction/screens/HomeScreen/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    SizedBox(height: 32),
                    SearchBox(),
                    SizedBox(height: 32),
                    InfoCard(),
                    SizedBox(height: 32),
                    Text(
                      'Trending',
                      style: TextStyle(
                        fontSize: 26,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'sbux'.toUpperCase(),
                                  ),
                                  Text('Starbucks'),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('780,64'),
                                  Text('+0.20'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
