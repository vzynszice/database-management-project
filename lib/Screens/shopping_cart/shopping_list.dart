import 'package:flutter/material.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_list_item_widget.dart';

class ShoppingList extends StatefulWidget {
  final List<PurchasedItemModel> purchasedItems;
  final Function(PurchasedItemModel) onDelete;
  final Function() onQuantityChange;
  const ShoppingList({
    Key? key,
    required this.purchasedItems,
    required this.onDelete,
    required this.onQuantityChange,
  }) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: widget.purchasedItems
          .map(
            (e) => ShoppingListItemWidget(
              purchasedItemModel: e,
              onDelete: widget.onDelete,
              onQuantityChange: widget.onQuantityChange,
            ),
          )
          .toList(),
    );
  }
}
