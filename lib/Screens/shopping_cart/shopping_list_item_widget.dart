import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/item/view/item_information_view.dart';
import 'package:vtproje/Screens/shopping_cart/shop.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class ShoppingListItemWidget extends StatefulWidget {
  final PurchasedItemModel purchasedItemModel;
  final Function() onQuantityChange;
  final Function(PurchasedItemModel) onDelete;

  const ShoppingListItemWidget({
    Key? key,
    required this.purchasedItemModel,
    required this.onDelete,
    required this.onQuantityChange,
  }) : super(key: key);

  @override
  State<ShoppingListItemWidget> createState() => _ShoppingListItemWidgetState();
}

class _ShoppingListItemWidgetState extends State<ShoppingListItemWidget> {
  DataBaseService dataBaseService = DataBaseService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemInformationView(
                itemModel: widget.purchasedItemModel.item,
                userModel: DataBaseService.userModel),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.purchasedItemModel.item.imagePath,
                    height: 100,
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        textString: widget.purchasedItemModel.item.name,
                        fontSize: 17,
                      ),
                      CustomTextWidget(
                        textString:
                            "${widget.purchasedItemModel.item.price} TL",
                        fontSize: 15,
                        textColor: ColorConstants.orangeColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (widget.purchasedItemModel.quantity > 1) {
                            setState(() {
                              widget.purchasedItemModel.quantity--;
                              widget.onQuantityChange();
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.orangeColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: CustomTextWidget(
                          textString: "${widget.purchasedItemModel.quantity}",
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.purchasedItemModel.quantity++;
                            widget.onQuantityChange();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.orangeColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  onPressed: () => setState(() {
                        widget.onDelete(widget.purchasedItemModel);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
