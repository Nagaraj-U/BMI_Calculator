import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
import 'round_icon.dart';

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
  int weight=60;
  int age= 24;


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
                         style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 240,
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       RoundIconButton(
                         icon: FontAwesomeIcons.plus,
                         onPressed: (){
                           setState(() {
                             weight++;
                           });
                         },

                       ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        )
                      ],

                    )
                  ],
                ),
              ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',
                      style: kTextStyle,),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),

              ),
              )
            ],
          ),
          ),
          BottomButton(
            onTap: (){
              Calculator calc=Calculator(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                bmi: calc.getBMI(),
                result: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
              //Navigator.pushNamed(context, '/result');
            },
            buttonTitle: 'CALCULATE BMI',
          ),
        ],
      ),
    );
  }
}



