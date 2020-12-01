import 'package:dio/dio.dart';
import 'package:weather_news_app/models/NewsArticle.dart';
import 'package:weather_news_app/utils/strings.dart';

class NewsApiService {
  String newsUrl =
      'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=' +
          Strings.newsAppId;
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await dio.get(newsUrl);
    if (response.statusCode == 200) {
      final result = response.data;
      print("news data: ${response.data}");

      Iterable list = result['articles'];
      list.map((article) => {print(article)});

      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to get the top news');
    }
  }
}

class OpenWeatherApi {
  final newsUrl = 'https://api.openweathermap.org/data/2.5/forecast/daily?q=';
  Future<Response> getWeather(String city) async {
    String weatherUrl =
         newsUrl+
            city +
            '&appid=' +
            Strings.openWeatherAppId +
            '&units=imperial';
    print(weatherUrl);
    var dio = Dio();
    return await dio.get(weatherUrl);
  }
}


