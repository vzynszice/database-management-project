import 'package:flutter/material.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class CustomPopUp {
  static void show(BuildContext context, String message1, String message2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: Center(
              child: CustomTextWidget(textString: message1, fontSize: 20)),
          content: CustomTextWidget(textString: message2, fontSize: 18),
        );
      },
    );
  }
}
