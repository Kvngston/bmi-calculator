
import 'package:flutter/material.dart';

import 'constants.dart';

class IconContentWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;

  IconContentWidget({this.icon, this.text, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}