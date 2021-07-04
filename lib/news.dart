import 'dart:convert';

import 'package:DailyNews/models/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class News with ChangeNotifier {
  List<Article> _news = [];

  List<Article> get news {
    return [..._news];
  }

  List<Article> _googlenews = [];

  List<Article> get googlenews {
    return [..._googlenews];
  }

  List<Article> _businessnews = [];

  List<Article> get businessnews {
    return [..._businessnews];
  }

  List<Article> _sportsnews = [];

  List<Article> get sportsnews {
    return [..._sportsnews];
  }

  List<Article> _entartainmentnews = [];

  List<Article> get entartainmentnews {
    return [..._entartainmentnews];
  }

  List<Article> _sciencenews = [];

  List<Article> get sciencenews {
    return [..._sciencenews];
  }

  List<Article> _healthnews = [];

  List<Article> get healthnews {
    return [..._healthnews];
  }

  Map allNews;
  void getData() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=b676cf9bc748401fbb2aa22ce14dd962';
    final response = await http.get(url);
    allNews = json.decode(response.body);

    print(json.decode(response.body));
    final List<Article> newslist = [];
    if (allNews['status'] == 'ok') {
      allNews['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          newslist.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            publishedAt: DateTime.parse(element['publishedAt']),
            url: element['url'],
            urlToImage: element['urlToImage'],
          ));

          _news = newslist;

          notifyListeners();
        }
      });
    }
  }

  void getGoogleNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=b676cf9bc748401fbb2aa22ce14dd962';
    final response = await http.get(url);

    allNews = json.decode(response.body);

    final List<Article> newslist = [];
    if (allNews['status'] == 'ok') {
      allNews['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          newslist.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            publishedAt: DateTime.parse(element['publishedAt']),
            url: element['url'],
            urlToImage: element['urlToImage'],
          ));

          _googlenews = newslist;

          notifyListeners();
        }
      });
    }
  }

  void getBusinessNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b676cf9bc748401fbb2aa22ce14dd962';
    final response = await http.get(url);

    allNews = json.decode(response.body);

    final List<Article> newslist = [];
    if (allNews['status'] == 'ok') {
      allNews['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          newslist.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            publishedAt: DateTime.parse(element['publishedAt']),
            url: element['url'],
            urlToImage: element['urlToImage'],
          ));

          _businessnews = newslist;

          notifyListeners();
        }
      });
    }
  }

  void getEntertainmentNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=b676cf9bc748401fbb2aa22ce14dd962';
    final response = await http.get(url);

    allNews = json.decode(response.body);

    final List<Article> newslist = [];
    if (allNews['status'] == 'ok') {
      allNews['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          newslist.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            publishedAt: DateTime.parse(element['publishedAt']),
            url: element['url'],
            urlToImage: element['urlToImage'],
          ));

          _entartainmentnews = newslist;

          notifyListeners();
        }
      });
    }
  }

  void getSportsNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=b676cf9bc748401fbb2aa22ce14dd962';
    final response = await http.get(url);

    allNews = json.decode(response.body);

    final List<Article> newslist = [];
    if (allNews['status'] == 'ok') {
      allNews['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          newslist.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            publishedAt: DateTime.parse(element['publishedAt']),
            url: element['url'],
            urlToImage: element['urlToImage'],
          ));

          _sportsnews = newslist;

          notifyListeners();
        }
      });
    }
  }

  void getHealthNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=b676cf9bc748401fbb2aa22ce14dd962';
    final response = await http.get(url);

    allNews = json.decode(response.body);

    final List<Article> newslist = [];
    if (allNews['status'] == 'ok') {
      allNews['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          newslist.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            publishedAt: DateTime.parse(element['publishedAt']),
            url: element['url'],
            urlToImage: element['urlToImage'],
          ));

          _healthnews = newslist;

          notifyListeners();
        }
      });
    }
  }

  void getScienceNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=b676cf9bc748401fbb2aa22ce14dd962';
    final response = await http.get(url);

    allNews = json.decode(response.body);

    final List<Article> newslist = [];
    if (allNews['status'] == 'ok') {
      allNews['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          newslist.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            publishedAt: DateTime.parse(element['publishedAt']),
            url: element['url'],
            urlToImage: element['urlToImage'],
          ));

          _sciencenews = newslist;

          notifyListeners();
        }
      });
    }
  }

  Article findByTitle(String title, int selectedIndex) {
    if (selectedIndex == 0) {
      return news.firstWhere((neww) => neww.title == title);
    }
    if (selectedIndex == 1) {
      return businessnews.firstWhere((neww) => neww.title == title);
    }
    if (selectedIndex == 2) {
      return entartainmentnews.firstWhere((neww) => neww.title == title);
    }
    if (selectedIndex == 3) {
      return sportsnews.firstWhere((neww) => neww.title == title);
    }
    if (selectedIndex == 4) {
      return healthnews.firstWhere((neww) => neww.title == title);
    }
    if (selectedIndex == 5) {
      return sciencenews.firstWhere((neww) => neww.title == title);
    }
    return googlenews.firstWhere((neww) => neww.title == title, orElse: () {
      print(title);
      print(selectedIndex);
    });
  }
}
