import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_news_app/components/roundedbutton.dart';
import 'package:weather_news_app/notifier/AuthNotifier.dart';
import 'package:weather_news_app/pages/login/Background.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageBody(context),
    );
  }

  Widget pageBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AuthNotifier>(
        builder: (context, navigationProvider, _) => Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Weather",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 26),
                          ),
                          Text(
                            "News",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 26),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(height: size.height * 0.05),
                    RoundedButton(
                      press: () {
                        navigationProvider.signinFacebook(context);
                      },
                      textBtn: 'Facebook',
                      colorBtn: Color(0xFF1877F2),
                      textColorBtn: Colors.white,
                    ),
                    RoundedButton(
                      press: () {
                        navigationProvider.signinGoogle(context);
                      },
                      textBtn: 'Google',
                      colorBtn: Colors.white,
                      textColorBtn: Colors.black,
                    ),
                  ],
                ),
              ),
            ));
  }
}
