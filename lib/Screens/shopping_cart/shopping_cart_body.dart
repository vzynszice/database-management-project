import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/item/view/item_buying_view.dart';
import 'package:vtproje/Screens/shopping_cart/shop.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';
import 'package:vtproje/Screens/shopping_cart/custom_button.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_list.dart';

class ShoppingCartBody extends StatefulWidget {
  final List<PurchasedItemModel> purchasedItems;
  final Function(PurchasedItemModel) onDelete;
  final DataBaseService dataBaseService;
  const ShoppingCartBody(
      {Key? key,
      required this.purchasedItems,
      required this.onDelete,
      required this.dataBaseService})
      : super(key: key);

  @override
  _ShoppingCartBodyState createState() => _ShoppingCartBodyState();
}

class _ShoppingCartBodyState extends State<ShoppingCartBody> {
  double shippingFee = Shop.shippingFee;
  late int subTotal;
  late double total;

  @override
  void initState() {
    super.initState();
    _updateTotal();
  }

  void _updateTotal() {
    subTotal = widget.purchasedItems.fold(
      0,
      (sum, item) => sum + (item.item.price * item.quantity),
    );
    total = shippingFee + subTotal;
  }

  void onQuantityChange() {
    setState(() {
      subTotal = widget.purchasedItems.fold(
        0,
        (sum, item) => sum + (item.item.price * item.quantity),
      );

      total = shippingFee + subTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShoppingList(
                    purchasedItems: widget.purchasedItems,
                    onQuantityChange: onQuantityChange,
                    onDelete: widget.onDelete),
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
                        textString: "${shippingFee} TL",
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
                          textString: "${subTotal} TL",
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
                      textString: "${total} TL",
                      fontSize: 17,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemBuyView(
                              purchasedItems: widget.purchasedItems,
                              userModel: DataBaseService.userModel,
                              cost: total,
                              dataBaseService: widget.dataBaseService)),
                    ),
                    child: CustomButton(
                      buttonText: "Checkout",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
