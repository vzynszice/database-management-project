import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/product/widgets/user_information_view/user_information_button_widget.dart';
import 'package:vtproje/product/widgets/user_information_view/user_information_text_field.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class UserInformationView extends StatefulWidget {
  const UserInformationView(
      {super.key, required this.dataBaseService, required this.userModel});
  final DataBaseService dataBaseService;
  final UserModel userModel;

  @override
  State<UserInformationView> createState() => _UserInformationViewState();
}

class _UserInformationViewState extends State<UserInformationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyTransparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserInformationButton(
                    buttonSubline: "Boughts",
                    buttonIcon: Icons.shopping_cart_checkout,
                    index: 0,
                    dataBaseService: widget.dataBaseService,
                  ),
                  UserInformationButton(
                    buttonSubline: "Solds",
                    buttonIcon: Icons.shopify_outlined,
                    index: 1,
                    dataBaseService: widget.dataBaseService,
                  ),
                  UserInformationButton(
                    buttonSubline: "My Products",
                    buttonIcon: Icons.window_sharp,
                    index: 2,
                    dataBaseService: widget.dataBaseService,
                  )
                ],
              ),
            ),
            UserInformationWidgets(
              dataBaseService: widget.dataBaseService,
              textFieldsForValues: true,
              userModel: widget.userModel,
            ),
          ],
        ),
      ),
    );
  }
}
