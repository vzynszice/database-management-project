import 'package:flutter/material.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_list_item_widget.dart';

class ShoppingList extends StatelessWidget {
  final List<PurchasedItemModel> purchasedItems;
  const ShoppingList({super.key, required this.purchasedItems});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: purchasedItems
            .map((e) => ShoppingListItemWidget(purchasedItemModel: e))
            .toList());
  }
}
