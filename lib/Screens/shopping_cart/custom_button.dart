import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;

  const CustomButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 330,
      decoration: BoxDecoration(
          color: ColorConstants.orangeColor,
          borderRadius: BorderRadius.circular(10)),
      child:
          Center(child: CustomTextWidget(textString: buttonText, fontSize: 22)),
    );
  }
}
