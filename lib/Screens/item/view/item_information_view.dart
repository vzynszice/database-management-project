import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/constants/padding_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/item/view/item_buying_view.dart';
import 'package:vtproje/Screens/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class ItemInformationView extends StatefulWidget {
  const ItemInformationView(
      {super.key,
      required this.itemModel,
      required this.userModel,
      required this.dataBaseService});
  final ItemModel itemModel;
  final UserModel userModel;
  final DataBaseService dataBaseService;

  @override
  State<ItemInformationView> createState() => _ItemInformationViewState();
}

class _ItemInformationViewState extends State<ItemInformationView> {
  @override
<<<<<<< Updated upstream
=======
  void initState() {
    super.initState();
    updateSellCount();
  }

  int quantity = 1;

  void updateSellCount() async {
    int? sellCount =
        await widget.dataBaseService.getItemSellCount(widget.itemModel.id);

    if (sellCount != null) {
      setState(() {
        widget.itemModel.sellCount = sellCount;
      });
    }
  }

  @override
>>>>>>> Stashed changes
  Widget build(BuildContext context) {
    updateSellCount();
    return Scaffold(
      backgroundColor: ColorConstants.orangeColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.greyTransparent,
        leading: IconButton(
            onPressed: () {},
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
            height: 620,
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
                  height: 370,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    widget.itemModel.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      ItemTextWidget(
                        textString: widget.itemModel.name,
                        fontSize: 20,
                        padding: PaddingConstants.nameTextPadding,
                      ),
                      ItemTextWidget(
                        textString: "${widget.itemModel.price} TL",
                        fontSize: 22,
                        padding: PaddingConstants.priceTextPadding,
                        textColor: ColorConstants.orangeColor,
                      )
                    ],
                  ),
                ),
                ItemTextWidget(
                    textString: "Item: ${widget.itemModel.id}",
                    fontSize: 15,
                    padding: PaddingConstants.idTextPadding),
                ItemTextWidget(
                  textString: widget.itemModel.seller,
                  fontSize: 15,
                  padding: PaddingConstants.idTextPadding,
                  textColor: Colors.grey,
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
            padding: const EdgeInsets.only(top: 18.0, left: 230, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  )),
              child: const Center(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                      fontFamily: 'Francois One',
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ItemBuyView(userModel: widget.userModel);
                }));
              },
            ),
          )
        ]),
      ),
    );
  }
}
