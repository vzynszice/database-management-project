import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/shopping_cart/shop.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_cart_body.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_cart_empty.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_list.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key, required this.dataBaseService})
      : super(key: key);

  final DataBaseService dataBaseService;

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  void onDelete(PurchasedItemModel item) {
    setState(() {
      Shop.purchasedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              const CustomTextWidget(textString: "Shopping Cart", fontSize: 22),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xfff5f6f8),
        body: Shop.purchasedItems.isEmpty
            ? ShoppingCarEmpty(
                dataBaseService: widget.dataBaseService,
              )
            : ShoppingCartBody(
                purchasedItems: Shop.purchasedItems,
                onDelete: onDelete,
                dataBaseService: widget.dataBaseService,
              ),
      ),
    );
  }
}
