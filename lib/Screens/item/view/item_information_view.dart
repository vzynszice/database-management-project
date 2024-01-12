import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/constants/padding_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/item/view/item_buying_view.dart';
import 'package:vtproje/Screens/shopping_cart/shop.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class ItemInformationView extends StatefulWidget {
  const ItemInformationView(
      {super.key, required this.itemModel, required this.userModel});
  final ItemModel itemModel;
  final UserModel userModel;
  @override
  State<ItemInformationView> createState() => _ItemInformationViewState();
}

class _ItemInformationViewState extends State<ItemInformationView> {
  @override
  void initState() {
    super.initState();
  }

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.orangeColor,
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
          "Product Details",
          style: TextStyle(fontFamily: 'Francois One', fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 600,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(30),
                    bottomEnd: Radius.circular(30)),
                color: Color(0xFFFFFFFF)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(30),
                          bottomEnd: Radius.circular(30)),
                      color: ColorConstants.greyTransparent),
                  height: 340,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    widget.itemModel.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemTextWidget(
                        textString: widget.itemModel.name,
                        fontSize: 20,
                      ),
                      ItemTextWidget(
                        textString: "${widget.itemModel.price} TL",
                        fontSize: 22,
                        textColor: ColorConstants.orangeColor,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: PaddingConstants.idTextPadding,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ItemTextWidget(
                          textString: widget.itemModel.sellerUsername,
                          fontSize: 15,
                          textColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: PaddingConstants.idTextPadding,
                  child: Row(
                    children: [
                      Icon(
                        Icons.numbers,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ItemTextWidget(
                          textString:
                              "${widget.itemModel.sellCount} ${widget.itemModel.sellCount == 1 ? 'Sale' : 'Sales'}",
                          fontSize: 15,
                          textColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const ItemTextWidget(
                    textString: 'Description',
                    fontSize: 20,
                    padding: PaddingConstants.descriptionTextPadding),
                ItemTextWidget(
                  textString: widget.itemModel.description,
                  fontSize: 13,
                  padding: PaddingConstants.descriptionSubPadding,
                  textColor: Colors.grey,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: CustomTextWidget(
                        textString: "${quantity}",
                        fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      )),
                  child: const Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontFamily: 'Francois One',
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    int index = Shop.purchasedItems.indexWhere(
                        (item) => item.item.id == widget.itemModel.id);

                    if (index != -1) {
                      Shop.purchasedItems[index].quantity += quantity;
                    } else {
                      PurchasedItemModel purchasedItem =
                          PurchasedItemModel(widget.itemModel, quantity);
                      Shop.purchasedItems.add(purchasedItem);
                    }
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
