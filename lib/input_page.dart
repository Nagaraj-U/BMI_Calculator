import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: CardChild(iconData: FontAwesomeIcons.mars,label: 'MALE',),
              ) ,
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: CardChild(iconData: FontAwesomeIcons.venus,label: 'FEMALE'),
                colour: Color(0xFF1D1E33),
              ),
              ),
            ],
          ),
          ),
          Expanded(child:ReusableCard(colour: Color(0xFF1D1E33)),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour: Color(0xFF1D1E33)),
              ),
              Expanded(child: ReusableCard(colour: Color(0xFF1D1E33)),
              )
            ],
          ),
          ),
        ],
      ),
    );
  }
}

