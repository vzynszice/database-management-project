import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/constants/padding_constants.dart';
<<<<<<< Updated upstream
import 'package:vtproje/Screens/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/product/widgets/item_buying_view/payment_buttons.dart';
=======
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/item/view/custom_pop_up.dart';
import 'package:vtproje/Screens/shopping_cart/shop.dart';
import 'package:vtproje/product/widgets/item_buying_view/navigate_pop-button.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/product/widgets/item_buying_view/payment_buttons.dart';
>>>>>>> Stashed changes
import 'package:vtproje/Screens/user/model/user_model.dart';

class ItemBuyView extends StatefulWidget {
  const ItemBuyView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<ItemBuyView> createState() => _ItemBuyViewState();
}

class _ItemBuyViewState extends State<ItemBuyView> {
  void updateBalance(int newBalance) {
    setState(() {
      widget.userModel.balance = newBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyTransparent,
      appBar: AppBar(
        backgroundColor: ColorConstants.greyTransparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
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
<<<<<<< Updated upstream
                    backgroundColor: ColorConstants.orangeColor,
                    buttonText: "Confirm",
                    textColor: Colors.white)
=======
                  textColor: Colors.white,
                  backgroundColor: ColorConstants.orangeColor,
                  buttonText: "Confirm",
                  onPressed: () async {
                    try {
                      int costAsInt = widget.cost.toInt();
                      bool paymentResult = await widget.dataBaseService.payment(
                        DataBaseService.userModel.userName,
                        costAsInt,
                        widget.purchasedItems,
                      );

                      if (paymentResult) {
                        CustomPopUp.show(context, "Thanks for purchasing.",
                            "A purchase was made");

                        Shop.purchasedItems.clear();
                        updateBalance(widget.userModel.balance);
                      } else {
                        if (widget.purchasedItems.isNotEmpty) {
                          CustomPopUp.show(
                              context, ":(", "You don't have enough money.");
                        } else {
                          CustomPopUp.show(context, "The cart is empty.",
                              "Fortuanely, there's an easy solution.");
                        }
                      }

                      return paymentResult;
                    } catch (e) {
                      print('Error converting widget.cost to int: $e');
                      // Handle the error (e.g., show an error message, log it, etc.)
                      return false; // or another value indicating a failed payment
                    }
                  },
                )
>>>>>>> Stashed changes
              ],
            ),
          )
        ],
      ),
    );
  }
}
