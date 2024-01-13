import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/login/login_view.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_button/custom_button.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';
import 'package:vtproje/Screens/product/widgets/login/form_field/form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
              )),
        ),
        backgroundColor: const Color(0xfff5f6f8),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const CustomTextWidget(
                    textString: "Create An Account", fontSize: 25),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CustomFormField(
                    isPassword: false,
                    text: "Full Name",
                    controller: fullNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomFormField(
                    isPassword: false,
                    text: "Email",
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomFormField(
                    isPassword: false,
                    text: "Username",
                    controller: usernameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomFormField(
                    isPassword: true,
                    text: "Password",
                    controller: passwordController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: CustomAuthButton(
                    usernameController: TextEditingController(),
                    passwordController: TextEditingController(),
                    buttonText: "Sign Up",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        textString: "Do you have an account? ",
                        fontSize: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LogInView(),
                            ),
                          );
                        },
                        child: CustomTextWidget(
                          textString: "Sign In",
                          fontSize: 15,
                          textColor: ColorConstants.orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
