import 'package:DailyNews/news.dart';
import 'package:DailyNews/screens/news_site_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = 'newsScreen';

  @override
  Widget build(BuildContext context) {
    final Map newsData = ModalRoute.of(context).settings.arguments;
    final news = Provider.of<News>(context)
        .findByTitle(newsData['title'], newsData['selectedIndex']);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.network(
                news.urlToImage,
                fit: BoxFit.cover,
                height: 350,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Published On: ' +
                        DateFormat('yMMMd').format(news.publishedAt),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                news.description,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    news.author == null ? '- Anonymous' : '- ' + news.author,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Read more',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => NewsSiteScreen(news.url),
                          ),
                        );
                      },
                      child: Text(
                        'Open offical news site',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
