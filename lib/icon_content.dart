import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.data});
  final String data;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          data,
          style: kDataTextStyle,
        ),
      ],
    );
  }
}
