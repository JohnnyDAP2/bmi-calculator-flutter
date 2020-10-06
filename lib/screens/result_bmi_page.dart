import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:bmi_calculator/components/calculator_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.bmiDescription});

  final String bmiResult;
  final String resultText;
  final String bmiDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleOfText,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kContentOfSubTitle,
                    ),
                    Text(
                      bmiResult,
                      style: kContentOfNumber,
                    ),
                    Text(
                      bmiDescription,
                      style: kContentOfTextContent,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            CalculatorButton(
              nameButton: 'RE-CALCULATE',
              navigator: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage())),
            ),
          ],
        ),
      ),
    );
  }
}
