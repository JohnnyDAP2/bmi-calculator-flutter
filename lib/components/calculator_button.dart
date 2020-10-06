import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

//Calculator Button (Bottom in Screen)
class CalculatorButton extends StatelessWidget {
  const CalculatorButton({@required this.nameButton, this.navigator});

  final String nameButton;
  final Function navigator;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigator,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: kButtonContainerHeight,
        width: double.infinity,
        color: kButtonContainerColor,
        child: Center(
            child: Text(
          nameButton,
          style: kCalculatorButton,
        )),
      ),
    );
  }
}
