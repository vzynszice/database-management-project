import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/login/login_view.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class CustomAuthButton extends StatelessWidget {
  final DataBaseService dataBaseService;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController ageController;
  final TextEditingController addressController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String buttonText;

  //final Function(BuildContext, String, String) onPressed;

  const CustomAuthButton({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.buttonText,
    required this.nameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.ageController,
    required this.addressController,
    required this.dataBaseService,

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
        onPressed: () {
          dataBaseService.insertRecord(
              nameController.text,
              phoneNumberController.text,
              emailController.text,
              int.parse(ageController.text),
              addressController.text,
              usernameController.text,
              passwordController.text,
              0,
              0);

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LogInView(
              dataBaseService: dataBaseService,
            );
          }));
        },
        child: CustomTextWidget(textString: buttonText, fontSize: 22),
      ),
    );
  }
}
