import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String childText;
  final Function onPressed;

  BottomButton({@required this.childText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
            child: Text(
          childText,
          style: kLargeButtonStyle,
        )),
        color: Color(0XFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}