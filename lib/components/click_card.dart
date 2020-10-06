import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//A Card of Increase-Decrease weight and age.
class ClickCard extends StatelessWidget {
  ClickCard({this.waString, this.waAdjust, this.minusButton, this.plusButton});

  final Function minusButton;
  final Function plusButton;
  final String waAdjust;
  final String waString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          waString,
          style: kStyleOfText,
        ),
        Text(
          waAdjust,
          style: kStyleBoldOfText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              custom: plusButton,
            ),
            SizedBox(
              width: 15.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              custom: minusButton,
            ),
          ],
        )
      ],
    );
  }
}
