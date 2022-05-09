import 'package:flutter/material.dart';
import 'package:housing_app/utils/constants.dart';
import 'package:housing_app/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String? text;
  final double width;
  final IconData? icon;

  const OptionButton({Key? key, this.text, required this.width, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        backgroundColor: COLOR_DARK_BLUE,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15));

    return Container(
      width: width,
      child: TextButton(
          style: flatButtonStyle,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: COLOR_WHITE,
                  ),
                  addHorizontalSpace(10),
                  Text(
                    text!,
                    style: TextStyle(color: COLOR_WHITE),
                  )
                ],
              ),
            ],
          ),
          onPressed: () {}),
    );
  }
}
