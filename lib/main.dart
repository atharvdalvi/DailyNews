import 'package:DailyNews/news.dart';
import 'package:DailyNews/screens/news_screen.dart';
import 'package:DailyNews/widgets/all_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => News()),
        ],
        child: MaterialApp(
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
          routes: {
            NewsScreen.routeName: (ctx) => NewsScreen(),
          },
        ));
  }
}
