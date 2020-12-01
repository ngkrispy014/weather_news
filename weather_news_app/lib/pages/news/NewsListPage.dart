import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_news_app/notifier/NewsListNotifier.dart';
import 'package:weather_news_app/pages/news/article/NewsArticlePage.dart';
import 'package:weather_news_app/pages/news/widget/NewsCards.dart';
import 'package:weather_news_app/notifier/AuthNotifier.dart';
import 'package:weather_news_app/pages/news/widget/NewsAppBar.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    final auth = Provider.of<AuthNotifier>(context, listen: false);
    auth.isLoggedIn().then((user) {
      print(user);
      if (user != true) Navigator.pushReplacementNamed(context, '/login');
    });
    Provider.of<NewsListNotifier>(context, listen: false).topHeadlines();
    super.initState();
  }

  Widget build(BuildContext context) {
    NewsListNotifier news = Provider.of<NewsListNotifier>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: NewsAppbar(),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: news.articles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsArticlePage(
                                article: news.articles[index],
                              )));
                },
                child: NewsCards(
                  newsImageUrl: news.articles[index].urlToImage,
                  newsDescription: news.articles[index].description,
                  newsTitle: news.articles[index].description,
                ),
              );
            }),
      ),
    );
  }
}
