import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class ShoppingListItemWidget extends StatefulWidget {
  final PurchasedItemModel purchasedItemModel;
  const ShoppingListItemWidget({Key? key, required this.purchasedItemModel});

  @override
  State<ShoppingListItemWidget> createState() => _ShoppingListItemWidgetState();
}

class _ShoppingListItemWidgetState extends State<ShoppingListItemWidget> {
  ItemModel get itemModel => widget.purchasedItemModel.item;
  int get quantity => widget.purchasedItemModel.quantity;
  DataBaseService dataBaseService = DataBaseService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              itemModel.imagePath,
              height: 100,
              width: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(textString: itemModel.name, fontSize: 17),
                FutureBuilder<String>(
                  future:
                      dataBaseService.getSellerName(itemModel.sellerUsername),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomTextWidget(
                        textString: snapshot.data!,
                        fontSize: 15,
                        textColor: Colors.grey.shade500,
                      );
                    } else if (snapshot.hasError) {
                      return CustomTextWidget(
                        textString: 'Error fetching seller name',
                        fontSize: 15,
                        textColor: Colors.red,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                CustomTextWidget(
                  textString: "${itemModel.price} TL",
                  fontSize: 15,
                  textColor: ColorConstants.orangeColor,
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
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
                    textString: "${quantity}",
                    fontSize: 15,
                  ),
                ),
                InkWell(
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
      ),
    );
  }
}
