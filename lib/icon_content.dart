import 'package:flutter/material.dart';
import 'constants.dart';

class CardChild extends StatelessWidget {

  final IconData iconData;
  final String label;
  CardChild({this.iconData,this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          //FontAwesomeIcons.mars,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          //'MALE',
          label,
          style: kTextStyle,
        )
      ],
    );
  }
}



