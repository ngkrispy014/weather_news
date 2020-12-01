import 'package:weather_news_app/models/WeatherForecastModel.dart';

class NewsArticleViewModel {
  WeatherForecastModel _weatherForecast;

  NewsArticleViewModel({WeatherForecastModel weatherForecastModel}) : _weatherForecast= weatherForecastModel;

  City get city=> _weatherForecast.city;

  String  get cod => _weatherForecast.cod;

  double  get message => _weatherForecast.message;

  int get cnt => _weatherForecast.cnt;

  List<WeatherConditionDetails> get list => _weatherForecast.list;

}


