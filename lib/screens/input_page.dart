import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Screens/result_bmi_page.dart';
import 'package:bmi_calculator/components/calculator_button.dart';
import 'package:bmi_calculator/components/click_card.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/calculator_brian.dart';

enum Gender {
  male,
  female,
}
Widget color;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //for prepare to change color.
//  Color maleButton = inactiveCardColor;
//  Color femaleButton = inactiveCardColor;

  Gender isSelected;
  int height = 175;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    //  new object (ReusableCard)
                    child: ReusableCard(
                      select: () => setState(() {
                        isSelected = Gender.male;
                      }),
                      color: isSelected == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      //  new object (GenderInfo)
                      cardChild: GenderInfo(
                        sex: 'MALE',
                        iconSex: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    //  new object (ReusableCard)
                    child: ReusableCard(
                      select: () => setState(() {
                        isSelected = Gender.female;
                      }),
                      color: isSelected == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: GenderInfo(
                        sex: 'FEMALE',
                        iconSex: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //  new object (ReusableCard)
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kStyleOfText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kStyleBoldOfText,
                        ),
                        Text(
                          'cm',
                          style: kStyleOfText,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x1fEB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 90,
                        max: 200,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    //  new object (ReusableCard)
                    child: ReusableCard(
                      color: kActiveCardColor,
                      //  new object (ClickCard)
                      cardChild: ClickCard(
                        waString: 'WEIGHT',
                        waAdjust: weight.toString(),
                        minusButton: () => setState(() {
                          weight--;
                        }),
                        plusButton: () => setState(() {
                          weight++;
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                    //  new object (ReusableCard)
                    child: ReusableCard(
                      color: kActiveCardColor,
                      // new object (ClickCard)
                      cardChild: ClickCard(
                        waString: 'AGE',
                        waAdjust: age.toString(),
                        minusButton: () => setState(() {
                          age--;
                        }),
                        plusButton: () => setState(() {
                          age++;
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CalculatorButton(
              nameButton: 'CALCULATE',
              navigator: () {
                CalculatorBrian calBMI =
                    CalculatorBrian(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calBMI.calculatorBMI(),
                              resultText: calBMI.getResult(),
                              bmiDescription: calBMI.getDescription(),
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
