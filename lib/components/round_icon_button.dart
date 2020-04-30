import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onClick;

  RoundIconButton({@required this.iconData, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      onPressed: onClick,
      child: Icon(iconData),
    );
  }
}