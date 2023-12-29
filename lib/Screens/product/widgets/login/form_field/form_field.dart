import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Size size;
  final double formfieldheight;
  final double formfieldwidth;
  final bool isPassword;
  final String text;
  final TextEditingController controller;
  final IconData icon;

  const CustomFormField({
    super.key,
    required this.size,
    required this.formfieldheight,
    required this.formfieldwidth,
    required this.isPassword,
    required this.text,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * formfieldheight,
      width: size.width * formfieldwidth,
      decoration: const BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // border: Border.all(width: 2, color: const Color(0xff413D65)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            prefixIcon: Icon(icon, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
