import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String textBtn;
  final Function press;
  final Color colorBtn, textColorBtn;

  const RoundedButton(
      {Key key, this.textBtn, this.press, this.colorBtn, this.textColorBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29.0),
        child: FlatButton(
          onPressed: () {
            press();
          },
          child: Text(
            textBtn,
            style: TextStyle(color: textColorBtn),
          ),
          color: colorBtn,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        ),
      ),
    );
  }
}
