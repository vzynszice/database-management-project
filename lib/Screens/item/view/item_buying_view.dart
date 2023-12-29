import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/constants/padding_constants.dart';
import 'package:vtproje/Screens/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/product/widgets/item_buying_view/payment_buttons.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class ItemBuyView extends StatefulWidget {
  const ItemBuyView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<ItemBuyView> createState() => _ItemBuyViewState();
}

class _ItemBuyViewState extends State<ItemBuyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyTransparent,
      appBar: AppBar(
        backgroundColor: ColorConstants.greyTransparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            )),
        centerTitle: true,
        title: const Text(
          "Payment Details",
          style: TextStyle(fontFamily: 'Francois One', fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ItemTextWidget(
            textString: "Payment",
            fontSize: 20,
            padding: PaddingConstants.nameTextPadding,
            textColor: ColorConstants.orangeColor,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 70,
              child: ListTile(
                leading: const Icon(
                  Icons.wallet_rounded,
                  size: 55,
                  color: ColorConstants.orangeColor,
                ),
                title: ItemTextWidget(
                  textString: "YOUR BUDGET: ${widget.userModel.budget} TL",
                  fontSize: 25,
                  padding: const EdgeInsets.all(5),
                ),
                tileColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
          ),
          const ItemTextWidget(
            textString: "Address",
            fontSize: 20,
            padding: PaddingConstants.nameTextPadding,
            textColor: ColorConstants.orangeColor,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              leading: const Icon(
                Icons.location_on,
                size: 55,
                color: ColorConstants.orangeColor,
              ),
              title: const ItemTextWidget(
                textString: "Home Address",
                fontSize: 18,
                padding: EdgeInsets.all(5),
              ),
              subtitle: ItemTextWidget(
                textString: widget.userModel.address,
                fontSize: 14,
                textColor: Colors.grey,
              ),
              tileColor: Colors.white,
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_right)),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PaymentButton(
                  backgroundColor: ColorConstants.greyTransparent,
                  buttonText: "Cancel",
                  textColor: ColorConstants.orangeColor,
                ),
                PaymentButton(
                    backgroundColor: ColorConstants.orangeColor,
                    buttonText: "Confirm",
                    textColor: Colors.white)
              ],
            ),
          )
        ],
      ),
    );
  }
}
