import 'package:flutter/material.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_button/custom_button.dart';
import 'package:vtproje/Screens/product/widgets/login/form_field/form_field.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f6f8),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: const BoxDecoration(
                      /* image: DecorationImage(
                      image: AssetImage('assets/images/handmade_logo.png'),
                      fit: BoxFit.cover,
                    ),*/
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome!",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text("Sign in to continue",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w200)),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CustomFormField(
                            size: screenSize,
                            formfieldheight: 0.07,
                            formfieldwidth: 0.8,
                            isPassword: false,
                            text: "Username",
                            controller: TextEditingController(),
                            icon: Icons.person),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CustomFormField(
                            size: screenSize,
                            formfieldheight: 0.07,
                            formfieldwidth: 0.8,
                            isPassword: true,
                            text: "Password",
                            controller: TextEditingController(),
                            icon: Icons.password),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CustomButton(
                          usernameController: TextEditingController(),
                          passwordController: TextEditingController(),
                          height: 0.07,
                          width: 0.8,
                        ),
                      )
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
