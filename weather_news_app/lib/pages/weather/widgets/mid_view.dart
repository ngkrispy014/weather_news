import 'package:flutter/material.dart';
import 'package:weather_news_app/models/WeatherForecastModel.dart';
import 'package:weather_news_app/utils/strings.dart';
import 'package:weather_news_app/utils/convert_icon.dart';

class MidView extends StatelessWidget {
  final WeatherForecastModel weather;

  const MidView({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = weather.list;
    var city = weather.city.name;
    var country = weather.city.country;
    var formattedDate =
        new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
    var forecast = forecastList[0];

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "$city, $country",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${Strings.getFormattedDate(formattedDate)}",
              style: TextStyle(fontSize: 15,color: Colors.white),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(
                  weatherDescription: forecastList[0].weather[0].main,
                  size: 198),
            ),

            Text(
              "${forecast.weather[0].description.toUpperCase()}",
              style: TextStyle(fontSize: 28,color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${forecast.temp.day.toStringAsFixed(0)}°F",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
