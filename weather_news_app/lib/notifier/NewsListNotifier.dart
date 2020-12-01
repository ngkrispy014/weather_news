import 'package:flutter/material.dart';
import 'package:weather_news_app/models/NewsArticle.dart';
import 'package:weather_news_app/services/WebServices.dart';
import 'package:weather_news_app/viewmodel/NewsArticleViewModel.dart';

enum LoadingStatus{
  completed,
  searching,
  empty
}
class NewsListNotifier with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  void topHeadlines() async{
    List<NewsArticle> newsarticles = await NewsApiService().fetchTopHeadlines();
    notifyListeners();

    this.articles = newsarticles.map((article) => NewsArticleViewModel(article:article)).toList();
    if(this.articles.isEmpty){
      this.loadingStatus = LoadingStatus.empty;
    }
    else{
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}