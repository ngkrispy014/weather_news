import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_news_app/utils/constants.dart';
import 'package:weather_news_app/notifier/AuthNotifier.dart';

class NewsAppbar extends StatefulWidget {
  @override
  _NewsAppbarState createState() => _NewsAppbarState();
}

class _NewsAppbarState extends State<NewsAppbar> {
  Widget build(BuildContext context) {
    var wf = Provider.of<AuthNotifier>(context, listen: false);

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[
          Text(
            "Weather",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
          Text(
            "News",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        FlatButton.icon(
            onPressed: () {
              setState(() {
                wf.signOut(context);
              });
            },
            icon: Icon(Icons.person),
            label: Text('Logout'))
      ],
    );
  }
}
