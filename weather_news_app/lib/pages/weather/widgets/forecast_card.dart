import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_news_app/models/WeatherForecastModel.dart';
import 'package:weather_news_app/utils/strings.dart';

Widget forecastCard(WeatherForecastModel weather, int index) {
  var forecastList = weather.list;
  var dayOfWeek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Strings.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(205, 212, 228, .2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            dayOfWeek,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),

          CachedNetworkImage(
            width: 60,
            height: 60,
            imageUrl:'http://openweathermap.org/img/wn/${forecastList[index].weather[0].icon}@2x.png',
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          ),

          Text(
            'High: ' + forecastList[index].temp.max.toStringAsFixed(0) + ' °F',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          Text(
            'Low: ' + forecastList[index].temp.min.toStringAsFixed(0) + ' °F',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ));
}

