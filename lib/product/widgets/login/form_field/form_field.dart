import 'package:flutter/material.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class CustomFormField extends StatelessWidget {
  final bool isPassword;
  final String text;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    required this.isPassword,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(textString: text, fontSize: 15),
        Container(
          height: 40,
          width: 330,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.all(width: 2, color: const Color(0xff413D65)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              style: const TextStyle(fontSize: 20, fontFamily: "Francois One"),
              decoration: const InputDecoration(
                border: InputBorder.none,
                /*  hintText: text,
                prefixIcon: Icon(icon, color: Colors.black),*/
              ),
            ),
          ),
        ),
      ],
    );
  }
}
