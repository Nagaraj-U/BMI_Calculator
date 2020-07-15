import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmi,@required this.result,@required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kResultPageTitleStyle,
              ),
              margin: EdgeInsets.only(top: 3),
              padding: EdgeInsets.all(15),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Text(
                    result,
                  style: kResultPageTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kResultBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
            //Navigator.pushNamed(context, '/');
          },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
