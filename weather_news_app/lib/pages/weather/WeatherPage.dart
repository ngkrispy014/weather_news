import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_news_app/models/WeatherForecastModel.dart';
import 'package:weather_news_app/notifier/WeatherNotifier.dart';
import 'package:weather_news_app/pages/weather/widgets/bottom_view.dart';
import 'package:weather_news_app/pages/weather/widgets/mid_view.dart';
import 'package:weather_news_app/components/gradient_container.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _cityName = "Cavite";

  void _getWeather(city) {
    Provider.of<WeatherNotifier>(context, listen: false).fetchWeather(city);
  }

  @override
  void initState() {
    _getWeather(_cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WeatherNotifier wf = Provider.of<WeatherNotifier>(context);

    var forecastList = wf.weather.list;

    if (wf.loadingStatus == LoadingStatus.completed ||
        wf.loadingStatus == LoadingStatus.empty) {
      return Scaffold(
          body: _buildGradientContainer(
              forecastList[0].weather[0].main,
              ListView(
                  children: <Widget>[textFieldView(), bodyView(context, wf)])));
    } else {
      return Scaffold(
          body: _buildGradientContainer(
              "Clear",
              ListView(children: <Widget>[
                textFieldView(),
                SimpleDialog(
                    backgroundColor: Colors.black54,
                    children: <Widget>[
                      Center(
                        child: Column(children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Please Wait....",
                            style: TextStyle(color: Colors.blueAccent),
                          )
                        ]),
                      )
                    ])
              ])));
    }
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: new Theme(
        data: new ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
        ),
        child: TextField(
          style: TextStyle(fontSize: 20, color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Enter City Name",
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              focusColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              contentPadding: EdgeInsets.all(8)),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              _getWeather(_cityName);
            });
          },
        ),
      ),
    );
  }

  Widget bodyView(BuildContext context, WeatherNotifier wf) {
    switch (wf.loadingStatus) {
      case LoadingStatus.completed:
        return Container(
            child: Column(
          children: <Widget>[
            MidView(
              weather: wf.weather,
            ),
            SingleChildScrollView(
                child: BottomView(
              weather: wf.weather,
            ))
          ],
        ));
        break;
      case LoadingStatus.searching:
        return Center(
          child: new SizedBox(
            height: 50.0,
            width: 50.0,
            child: new CircularProgressIndicator(
              value: null,
              strokeWidth: 7.0,
            ),
          ),
        );
        break;
      case LoadingStatus.empty:
        return Padding(
          padding: const EdgeInsets.only(top: 220.0),
          child: Container(
            child: Center(
              child: Text(
                "No Data Found",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
        );
        break;
      default:
        {
          return Center(
            child: Text(
              "No Data Found",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          );
        }
        break;
    }
  }

  GradientContainer _buildGradientContainer(
      String weatherDescription, Widget child) {
    GradientContainer container;
    container = GradientContainer(color: Colors.lightBlue, child: child);

    print(weatherDescription);
    switch (weatherDescription) {
      case "Clear":
        {
          return container =
              new GradientContainer(color: Colors.yellow, child: child);
        }
        break;
      case "Clouds":
        {
          return container =
              new GradientContainer(color: Colors.indigo, child: child);
        }
        break;
      case "Rain":
        {
          container =
              new GradientContainer(color: Colors.deepPurple, child: child);
        }
        break;
      case "Snow":
        {
          return container =
              new GradientContainer(color: Colors.lightBlue, child: child);
        }
        break;
      default:
        {
          return container =
              new GradientContainer(color: Colors.lightBlue, child: child);
        }
        break;
    }
    return container;
  }
}
