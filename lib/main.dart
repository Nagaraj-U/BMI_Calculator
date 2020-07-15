import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21)
      ),
      home: InputPage(),
      //home: InputPage(),
//      routes: {
//        '/': (context) => InputPage(),
//        '/result': (context) => ResultPage(
//        )
//      },
    );
  }
}

