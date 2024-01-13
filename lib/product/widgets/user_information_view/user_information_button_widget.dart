import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/Screens/user/view/solds/solds_view.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/user/view/boughts/boughts_view.dart';
import 'package:vtproje/Screens/user/view/myproducts/my_products_view.dart';

class UserInformationButton extends StatelessWidget {
  const UserInformationButton(
      {super.key,
      required this.buttonSubline,
      required this.buttonIcon,
      required this.index,
      required this.dataBaseService,
      required this.userModel});
  final String buttonSubline;
  final IconData buttonIcon;
  final int index;
  final DataBaseService dataBaseService;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              if (index == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BoughtProductsView(
                    userModel: userModel,
                    headlineString: "Purchased Items",
                    dataBaseService: dataBaseService,
                  );
                }));
              } else if (index == 1) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SoldsProductsView(
                    userModel: userModel,
                    headlineString: "Products Sold",
                    dataBaseService: dataBaseService,
                  );
                }));
              } else {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MyProductsView(
                    userModel: userModel,
                    headlineString: "My Products",
                    dataBaseService: dataBaseService,
                  );
                }));
              }
            },
            icon: Icon(
              buttonIcon,
              color: ColorConstants.orangeColor,
              size: 40,
            )),
        ItemTextWidget(
          textString: buttonSubline,
          fontSize: 15,
          textColor: ColorConstants.orangeColor,
        )
      ],
    );
  }
}
