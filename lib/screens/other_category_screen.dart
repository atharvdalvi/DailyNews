import 'package:DailyNews/screens/home_screen.dart';
import 'package:DailyNews/widgets/all_news.dart';
import 'package:DailyNews/widgets/top_five.dart';
import 'package:flutter/material.dart';

class OtherCategoryScreen extends StatefulWidget {
  final List selectedtopfive;
  final List allnews;
  final int selectedIndex;
  OtherCategoryScreen({this.selectedtopfive, this.allnews, this.selectedIndex});
  @override
  _OtherCategoryScreenState createState() => _OtherCategoryScreenState();
}

class _OtherCategoryScreenState extends State<OtherCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: TopFive(widget.selectedtopfive),
          ),
          Expanded(
            child: AllNews(
              news: widget.allnews,
              selectedIndex: widget.selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}
