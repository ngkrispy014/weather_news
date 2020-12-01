import 'package:flutter/material.dart';
import 'package:weather_news_app/models/WeatherForecastModel.dart';

import 'forecast_card.dart';

//Better way of doing business!
class BottomView extends StatelessWidget {
  final WeatherForecastModel weather;

  const BottomView({Key key, this.weather}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "7-Day Weather Forecast".toUpperCase(),
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: weather.list.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.0,
                  height: 160,
                  child: forecastCard(weather, index),
                ),
              )),
        )
      ],
    );
  }
}

