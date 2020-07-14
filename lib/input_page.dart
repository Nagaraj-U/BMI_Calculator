import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'constants.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleCardColor=inactiveCardColor;
//  Color femaleCardColor=inactiveCardColor;
  Gender selectedGender;
  int height=180;

//  void updateCardColor(Gender selectedGender){
//    if(selectedGender==Gender.male){
//      if(maleCardColor==inactiveCardColor){
//        maleCardColor=activeCardColor;
//        femaleCardColor=inactiveCardColor;
//      }else{
//        maleCardColor=inactiveCardColor;
//      }
//    }
//
//    if(selectedGender==Gender.female){
//      if(femaleCardColor==inactiveCardColor){
//        femaleCardColor=activeCardColor;
//        maleCardColor=inactiveCardColor;
//      }else{
//        femaleCardColor=inactiveCardColor;
//      }
//    }
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR'),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  colour: selectedGender==Gender.male? kActiveCardColor : kInactiveCardColor,
                  cardChild: CardChild(iconData: FontAwesomeIcons.mars,label: 'MALE',),
              ) ,
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },
                  cardChild: CardChild(iconData: FontAwesomeIcons.venus,label: 'FEMALE'),
                colour: selectedGender==Gender.female? kActiveCardColor:kInactiveCardColor,
              ),
              ),
            ],
          ),
          ),
          Expanded(
            child:ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                  style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                         style: kHeightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 240,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                  )
                ],
              ),
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: kActiveCardColor,
              ),
              ),
              Expanded(child: ReusableCard(
                  colour: kActiveCardColor,
              ),
              )
            ],
          ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

