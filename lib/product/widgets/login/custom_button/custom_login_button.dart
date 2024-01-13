import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/home_page/all_items.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class LogInButton extends StatefulWidget {
  final String buttonText;
  final DataBaseService dataBaseService;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  //final Function(BuildContext, String, String) onPressed;

  LogInButton({
    Key? key,
    required this.buttonText,
    required this.dataBaseService,
    required this.usernameController,
    required this.passwordController,

    //required this.onPressed,
  }) : super(key: key);

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
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
        onPressed: () async {
          var loggedInUser = await widget.dataBaseService.login(
            widget.usernameController.text,
            widget.passwordController.text,
          );

          if (loggedInUser != null) {
            print(
                loggedInUser.userName); // Assign the loggedInUser to userModel
            DataBaseService.userModel = loggedInUser;
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return HomeView(
                userModel: loggedInUser,
                dataBaseService: widget.dataBaseService,
              );
            }));
          } else {
            print("ERROR");
            // Handle invalid login or error case here
          }
        },
        child: CustomTextWidget(textString: widget.buttonText, fontSize: 22),
      ),
    );
  }
}
