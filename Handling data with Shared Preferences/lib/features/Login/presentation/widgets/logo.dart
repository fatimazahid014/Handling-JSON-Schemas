import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.1)),
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(right: 32.5),
            child: Text(
              "Yellow",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // fontSize: Constants.LOGO_FONT_SIZE,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 34.0, left: 32.5),
              child: Text(
                "Cards",
                style: TextStyle(
                  // fontFamily: Constants.LOGO_FONT,
                  fontWeight: FontWeight.bold,
                  // fontSize: Constants.LOGO_FONT_SIZE,
                  color: Colors.black,
                ),
              ),
            )),
      ]),
    );
  }
}
