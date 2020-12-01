import 'package:flutter/material.dart';

Widget getWeatherIcon({String weatherDescription, double size}) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Image.asset('assets/images/clear-day.png');
      }
      break;
    case "Clouds":
      {
        return Image.asset('assets/images/cloudy.png');
      }
      break;
    case "Rain":
      {
        return Image.asset('assets/images/rain.png');
      }
      break;
    case "Snow":
      {
        return Image.asset('assets/images/snow.png');
      }
      break;
    default:
      {
        return Image.asset('assets/images/clear-day.png');
      }
      break;
  }
}
