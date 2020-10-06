import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrian {
  CalculatorBrian({@required this.height, @required this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculatorBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getDescription() {
    if (_bmi >= 25.0) {
      return 'You have a higher than normal body. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.Good Job!';
    } else {
      return 'You have a lower than normal body. You can eat a bit more.';
    }
  }
}
