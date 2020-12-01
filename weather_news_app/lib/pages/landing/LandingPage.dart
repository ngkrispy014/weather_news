import 'package:flutter/material.dart';

import 'package:weather_news_app/pages/news/NewsListPage.dart';
import 'package:weather_news_app/pages/weather/WeatherPage.dart';
import 'package:weather_news_app/utils/constants.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

// Implement body for each page here, separated by coma, in this example, we create a simple Text widget as the body for each page.
  List<Widget> _widgetOptions = <Widget>[NewsPage(), WeatherPage()];

// When user tap on one of the navigation item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny_outlined),
            label: 'Weather',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
