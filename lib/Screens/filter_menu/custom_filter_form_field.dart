import 'package:flutter/material.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';

class CustomFilterFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const CustomFilterFormField({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 150,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              textAlign: TextAlign.center,
              controller: controller,
              style: const TextStyle(fontSize: 16, fontFamily: "Francois One"),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: text),
            ),
          ),
        ),
      ],
    );
  }
}
