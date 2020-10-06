import 'package:flutter/material.dart';

//Refactor widget ลดการใช้ widget ซ ้ำซ้อน
class ReusableCard extends StatelessWidget {
  //syntactic sugar constructor.
  ReusableCard({@required this.color, this.cardChild, this.select});
  //@immutable property.
  final Color color;
  final Widget cardChild;
  final Function select;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: select,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: cardChild,
      ),
    );
  }
}
