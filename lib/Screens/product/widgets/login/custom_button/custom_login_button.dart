import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';

class LogInButton extends StatelessWidget {
  final String buttonText;

  //final Function(BuildContext, String, String) onPressed;

  const LogInButton({
    Key? key,
    required this.buttonText,

    //required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Set your desired height
      width: 330, // Set your desired width
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => ColorConstants.orangeColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {},
        child: CustomTextWidget(textString: buttonText, fontSize: 22),
      ),
    );
  }
}
