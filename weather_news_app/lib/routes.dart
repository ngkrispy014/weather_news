import 'package:flutter/material.dart';
import 'package:weather_news_app/pages/landing/LandingPage.dart';
import 'package:weather_news_app/pages/login/LoginPage.dart';
import 'package:weather_news_app/pages/news/NewsListPage.dart';
import 'package:weather_news_app/pages/weather/WeatherPage.dart';
import 'package:weather_news_app/pages/news/article/NewsArticlePage.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return MaterialPageRoute(builder: (context) => LandingPage());
      case "/news":
        return MaterialPageRoute(builder: (context) => NewsPage());
      case "/home":
        return MaterialPageRoute(builder: (context) => WeatherPage());
      case "/news_article":
        return MaterialPageRoute(builder: (context) => NewsArticlePage(article: null,));
      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}
