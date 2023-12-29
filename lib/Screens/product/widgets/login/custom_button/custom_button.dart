import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final double height;
  final double width;
  //final Function(BuildContext, String, String) onPressed;

  const CustomButton({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.height,
    required this.width,

    //required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * height,
      width: size.width * width,
      decoration: const BoxDecoration(
        color: Color(0xffe86f11),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: OutlinedButton(
        onPressed: () {
          //onPressed(context, usernameController.text, passwordController.text);
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xff4187f4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          "Sign In",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
