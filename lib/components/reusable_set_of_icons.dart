import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_icon_button.dart';

import 'constants.dart';

class ReusableSetOfIcons extends StatelessWidget {
  const ReusableSetOfIcons({
    @required this.label,
    @required this.minusClick,
    @required this.plusClick,
    @required this.labelData,
  });

  final String label;
  final int labelData;
  final Function plusClick;
  final Function minusClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label.toString(),
          style: kLabelTextStyle,
        ),
        Text(
          labelData.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              iconData: FontAwesomeIcons.minus,
              onClick: minusClick,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              iconData: FontAwesomeIcons.plus,
              onClick: plusClick,
            ),
          ],
        ),
      ],
    );
  }
}