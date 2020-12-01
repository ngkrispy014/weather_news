import 'package:flutter/material.dart';
import 'package:weather_news_app/pages/login/LoginBody.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}
