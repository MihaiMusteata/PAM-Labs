import 'package:bmi_app/utils/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 20.0,
        ),
        const SizedBox(
          width: 10.0, // Spațiu între icon și text
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
