import 'package:flutter/material.dart';

//Increase-Decrease Button
class RoundIconButton extends StatelessWidget {
  //Syntactic Sugar Constructor.
  RoundIconButton({@required this.icon, this.custom});

  //property
  final IconData icon;
  final Function custom;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: custom,
      elevation: 6.0,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
