import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key key, @required this.child}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -70,
            left: -55,
            child: new Image.asset(
              "assets/images/Ellipse1.png",
              width: size.width * 0.5,
            ),
          ),
          Positioned(
              bottom: -48,
              right: -45,
              child: new Image.asset(
                "assets/images/Ellipse2.png",
                width: size.width * 0.4,
              )),
          child,
        ],
      ),
    );
  }
}
