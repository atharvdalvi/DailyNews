import 'package:DailyNews/news.dart';
import 'package:DailyNews/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllNews extends StatefulWidget {
  final news;
  final int selectedIndex;
  AllNews({this.news, this.selectedIndex});
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  bool isInit = true;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {});
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<News>(context).getData();
    }
    isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<News>(context);
    newsData.news;
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.news.length,
        physics: ScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(NewsScreen.routeName, arguments: {
                  'title': widget.news[index].title,
                  'selectedIndex': widget.selectedIndex,
                });
              },
              child: Row(
                children: <Widget>[
                  Image.network(
                    widget.news[index].urlToImage,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text(
                        widget.news[index].title,
                        maxLines: 3,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        widget.news[index].description,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
