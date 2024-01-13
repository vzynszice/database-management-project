import 'package:flutter/material.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';
import 'package:vtproje/Screens/shopping_cart/custom_button.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_list.dart';

class ShoppingCartBody extends StatelessWidget {
  final List<PurchasedItemModel> purchasedItems;
  const ShoppingCartBody({super.key, required this.purchasedItems});

  @override
  Widget build(BuildContext context) {
    double shippingFee = 30;
    int subTotal = purchasedItems.fold(
        0, (sum, item) => sum + (item.item.price * item.quantity));

    double total = shippingFee + subTotal;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShoppingList(purchasedItems: purchasedItems),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                        textString: "Shipping Fee",
                        fontSize: 15,
                        textColor: Colors.grey.shade500),
                    CustomTextWidget(
                        textString: "${shippingFee}",
                        fontSize: 15,
                        textColor: Colors.grey.shade500),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                          textString: "Sub Total",
                          fontSize: 15,
                          textColor: Colors.grey.shade500),
                      CustomTextWidget(
                          textString: "${subTotal}",
                          fontSize: 15,
                          textColor: Colors.grey.shade500),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      textString: "Total",
                      fontSize: 17,
                    ),
                    CustomTextWidget(
                      textString: "${total}",
                      fontSize: 17,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
<<<<<<< Updated upstream
                  child: CustomButton(buttonText: "Checkout"),
=======
                  child: InkWell(
                    onTap: () async {
                      bool purchaseResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemBuyView(
                            purchasedItems: widget.purchasedItems,
                            userModel: DataBaseService.userModel,
                            cost: total,
                            dataBaseService: widget.dataBaseService,
                          ),
                        ),
                      );

                      if (purchaseResult != null && purchaseResult) {
                        setState(() {});
                      }
                    },
                    child: CustomButton(
                      buttonText: "Checkout",
                    ),
                  ),
>>>>>>> Stashed changes
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
