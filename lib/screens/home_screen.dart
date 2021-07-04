import 'package:DailyNews/news.dart';
import 'package:DailyNews/screens/other_category_screen.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final List selectedtopfive;
  final List allnews;
  final int selectedIndex;
  HomeScreen({
    this.selectedtopfive,
    this.allnews,
    this.selectedIndex,
  });
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((_) {
      Provider.of<News>(context, listen: false).getGoogleNews();
      Provider.of<News>(context, listen: false).getData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<News>(context);
    final news = newsData.googlenews;
    final newsDataGeneral = Provider.of<News>(context);
    final newsGeneral = newsDataGeneral.news;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Daily',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'News',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 55,
            child: Categories(
              selectedIndex:
                  widget.selectedIndex == null ? 0 : widget.selectedIndex,
            ),
          ),
          Expanded(
            child: OtherCategoryScreen(
              selectedtopfive: widget.selectedtopfive == null
                  ? news
                  : widget.selectedtopfive,
              allnews: widget.selectedtopfive == null
                  ? newsGeneral
                  : widget.selectedtopfive,
              selectedIndex:
                  widget.selectedIndex == null ? 0 : widget.selectedIndex,
            ),
          )
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  int selectedIndex;
  Categories({this.selectedIndex});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((_) {
      Provider.of<News>(context, listen: false).getBusinessNews();
      Provider.of<News>(context, listen: false).getData();
      Provider.of<News>(context, listen: false).getGoogleNews();
      Provider.of<News>(context, listen: false).getEntertainmentNews();
      Provider.of<News>(context, listen: false).getSportsNews();
      Provider.of<News>(context, listen: false).getHealthNews();
      Provider.of<News>(context, listen: false).getScienceNews();
    });

    super.initState();
  }

  List<String> categories = [
    'General',
    'Business',
    'Entertainment',
    'Sports',
    'Health',
    'Science'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, index) => buildText(index),
      ),
    );
  }

  Widget buildText(int index) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.selectedIndex = index;
            });
            if (widget.selectedIndex == 0) {
              print('General');

              final newsData = Provider.of<News>(context, listen: false);
              final news = newsData.googlenews;

              final newsDataGeneral = Provider.of<News>(context, listen: false);
              final newsGeneral = newsDataGeneral.news;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                    allnews: newsGeneral,
                    selectedtopfive: news,
                    selectedIndex: 0,
                  ),
                ),
              );
            }
            if (widget.selectedIndex == 1) {
              print('Business');

              final newsData = Provider.of<News>(context, listen: false);
              final news = newsData.businessnews;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                    allnews: news,
                    selectedtopfive: news,
                    selectedIndex: 1,
                  ),
                ),
              );
            }
            if (widget.selectedIndex == 2) {
              print('Entertainment');
              final newsData = Provider.of<News>(context, listen: false);
              final news = newsData.entartainmentnews;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                    allnews: news,
                    selectedtopfive: news,
                    selectedIndex: 2,
                  ),
                ),
              );
            }
            if (widget.selectedIndex == 3) {
              print('Sports');
              final newsData = Provider.of<News>(context, listen: false);
              final news = newsData.sportsnews;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                    allnews: news,
                    selectedtopfive: news,
                    selectedIndex: 3,
                  ),
                ),
              );
            }
            if (widget.selectedIndex == 4) {
              print('Health');
              final newsData = Provider.of<News>(context, listen: false);
              final news = newsData.healthnews;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                    allnews: news,
                    selectedtopfive: news,
                    selectedIndex: 4,
                  ),
                ),
              );
            }
            if (widget.selectedIndex == 5) {
              print('Science');
              final newsData = Provider.of<News>(context, listen: false);
              final news = newsData.sciencenews;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(
                    allnews: news,
                    selectedtopfive: news,
                    selectedIndex: 5,
                  ),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.selectedIndex == index
                      ? Colors.black87
                      : Colors.black54,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15 / 4),
                height: 2,
                width: 20,
                color: widget.selectedIndex == index
                    ? Colors.black
                    : Colors.transparent,
              )
            ],
          ),
        ),
      );
}
