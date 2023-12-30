import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String buttonText;

  //final Function(BuildContext, String, String) onPressed;

  const CustomButton({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.buttonText,

    //required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 330,
      decoration: const BoxDecoration(
        color: ColorConstants.orangeColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: OutlinedButton(
        onPressed: () {
          //onPressed(context, usernameController.text, passwordController.text);
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorConstants.orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: 'Francois One',
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
