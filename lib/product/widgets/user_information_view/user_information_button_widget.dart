import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/user/view/boughts/boughts_view.dart';
import 'package:vtproje/Screens/user/view/myproducts/my_products_view.dart';

class UserInformationButton extends StatelessWidget {
  const UserInformationButton(
      {super.key,
      required this.buttonSubline,
      required this.buttonIcon,
      required this.index,
      required this.dataBaseService});
  final String buttonSubline;
  final IconData buttonIcon;
  final int index;
  final DataBaseService dataBaseService;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              if (index == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BoughtSoldProductsView(
                    headlineString: "Purchased Items",
                    dataBaseService: dataBaseService,
                  );
                }));
              } else if (index == 1) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BoughtSoldProductsView(
                    headlineString: "Products Sold",
                    dataBaseService: dataBaseService,
                  );
                }));
              } else {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MyProductsView(
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
