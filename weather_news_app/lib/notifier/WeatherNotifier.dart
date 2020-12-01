import 'package:flutter/cupertino.dart';
import 'package:weather_news_app/models/WeatherForecastModel.dart';
import 'package:weather_news_app/services/WebServices.dart';

enum LoadingStatus { completed, searching, empty }

class WeatherNotifier with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  WeatherForecastModel weather = WeatherForecastModel();
  String errorMessage;

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value;
    }
  }

  fetchWeather(city) async {
    this.loadingStatus = LoadingStatus.searching;

    await OpenWeatherApi()
        .getWeather(city)
        .then((value) => {
              if (value.statusCode == 200)
                {
                  setWeather(WeatherForecastModel.fromJson(value.data)),
                  this.loadingStatus = LoadingStatus.completed,
                  print(value.data.toString())
                }
              else
                {
                  throw Exception('Failed to get the Weather news'),
                  print(value)
                }
            })
        .catchError((e) {
      print(e.toString());

      this.loadingStatus = LoadingStatus.empty;
    });
    notifyListeners();
  }

  void setWeather(value) {
    weather = value;
    this.loadingStatus = LoadingStatus.completed;
  }
}
