import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/reusable_set_of_icons.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    colour: selectedGender == Gender.MALE
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: Center(
                      child: IconContentWidget(
                        icon: FontAwesomeIcons.mars,
                        iconSize: 80,
                        text: 'MALE',
                      ),
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    colour: selectedGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContentWidget(
                      icon: FontAwesomeIcons.venus,
                      iconSize: 80,
                      text: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              'CM',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30,
                            ),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x29eb1555),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            max: 320,
                            min: 120,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    colour: kActiveCardColor,
                    cardChild: ReusableSetOfIcons(
                      label: 'WEIGHT',
                      labelData: weight,
                      plusClick: () {
                        setState(() {
                          weight++;
                        });
                      },
                      minusClick: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    colour: kActiveCardColor,
                    cardChild: ReusableSetOfIcons(
                      label: 'AGE',
                      labelData: age,
                      minusClick: () {
                        setState(() {
                          age--;
                        });
                      },
                      plusClick: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            childText: 'CALCULATE',
            onPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmi: calc.calculateBmi(),
                          result: calc.getResults(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}

enum Gender { MALE, FEMALE }
