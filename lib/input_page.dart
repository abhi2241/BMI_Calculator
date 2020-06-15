import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_container.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  Gender selectGender;
  int height = 180;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    color: selectGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      data: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    color: selectGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      data: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kDataTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kValueTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kDataTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
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
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kDataTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kDataTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            text: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: calc.getBmi(),
                      suggest: calc.getSuggest(),
                      remark: calc.getRemark(),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      fillColor: Color(0xFFF4C4F5E),
      shape: CircleBorder(),
      elevation: 6.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
