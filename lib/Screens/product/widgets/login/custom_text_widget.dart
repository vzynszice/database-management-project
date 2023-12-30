import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.textString,
      required this.fontSize,
      this.padding = EdgeInsets.zero,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w100});
  final String textString;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final Color textColor;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        textString,
        style: TextStyle(
            fontFamily: 'Francois One',
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor),
      ),
    );
  }
}
