import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';

class UserInformationSaveButton extends StatelessWidget {
  const UserInformationSaveButton(
      {Key? key,
      required this.backgroundColor,
      required this.buttonText,
      required this.textColor,
      required this.onPressed})
      : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: 35,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                width: 0.5,
                color: ColorConstants.orangeColor,
              ),
            ),
          ),
          onPressed: () {
            onPressed();
          },
          child: Center(
            child: ItemTextWidget(
              textString: buttonText,
              fontSize: 20,
              textColor: textColor,
              padding: const EdgeInsets.all(1),
            ),
          ),
        ),
      ),
    );
  }
}
