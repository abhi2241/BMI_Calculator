import 'package:bmi_calculator/bottom_container.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.remark, this.suggest});

  final String bmi;
  final String remark;
  final String suggest;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Text(
                          remark,
                          style: kResultTextStyle,
                        ),
                      ),
                      Center(
                        child: Text(
                          bmi,
                          style: kResultBmiTextStyle,
                        ),
                      ),
                      Center(
                        child: Text(
                          suggest,
                          style: kRemarkTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              BottomContainer(
                text: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
