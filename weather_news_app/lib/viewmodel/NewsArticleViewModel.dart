import 'package:weather_news_app/models/NewsArticle.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get title => _newsArticle.title;

  String get author => _newsArticle.author;

  String get description => _newsArticle.description;

  String get urlToImage => _newsArticle.urlToImage;

  String get url => _newsArticle.url;

  String get publishedAt => _newsArticle.publishedAt;

  String get content => _newsArticle.content;
}
