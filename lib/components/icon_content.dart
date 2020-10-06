import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

//Refactor Widget ลดการใช้ widget ซ ้ำซ้อน
class GenderInfo extends StatelessWidget {
  //syntactic sugar constructor.
  GenderInfo({this.sex, this.iconSex, this.activeGenderColor});
  //@immutable property.
  final String sex;
  final IconData iconSex;
  final Color activeGenderColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconSex,
          size: 80.0,
          color: activeGenderColor,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          sex,
          style: kStyleOfText,
        ),
      ],
    );
  }
}
