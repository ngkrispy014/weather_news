import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Users/krispy/AndroidStudioProjects/weather_news_app/lib/utils/constants.dart';
import 'package:weather_news_app/notifier/AuthNotifier.dart';
import 'package:weather_news_app/notifier/NewsListNotifier.dart';
import 'package:weather_news_app/notifier/WeatherNotifier.dart';
import 'package:weather_news_app/pages/login/LoginPage.dart';
import 'package:weather_news_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsListNotifier>(
          create: (_) => NewsListNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthNotifier(),
        ),
        ChangeNotifierProvider<WeatherNotifier>(
          create: (_) => WeatherNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather News',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: LoginPage(),
        onGenerateRoute: Routes.materialRoutes,
      ),
    );
  }
}
