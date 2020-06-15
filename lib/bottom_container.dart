import 'package:flutter/material.dart';
import 'constants.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({this.text, this.onTap});

  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Center(
          child: Text(
            text,
            style: kBottomButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
