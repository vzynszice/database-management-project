import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';

// ignore: must_be_immutable
class AllProducts extends StatelessWidget {
  AllProducts({
    super.key,
  });
  List<ItemModel> itemModels = [
    ItemModel(
        5,
        100,
        "Handmade Candle",
        47,
        "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
        "Batuhan",
        "assets/images/soap.png"),
    ItemModel(
        6,
        200,
        "Handmade Basket",
        54,
        "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
        "Ayse",
        "assets/images/handmade_basket.png"),
    ItemModel(
        12,
        540,
        "Handmade Flower Pot",
        98,
        "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
        "Hiranur",
        "assets/images/handmade_flower_pot.png"),
    ItemModel(
        17,
        740,
        "Handmade Mask",
        23,
        "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
        "Elif",
        "assets/images/handmade_mask.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.longestSide,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: ScrollController(keepScrollOffset: false),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          itemModels[index].imagePath,
                          fit: BoxFit.fitWidth,
                          height: 108,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 8),
                        child: CustomTextWidget(
                          textString: itemModels[index].name,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CustomTextWidget(
                          textString: "Item ID: ${itemModels[index].id}",
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomTextWidget(
                              textString: itemModels[index].seller,
                              fontSize: 11,
                              textColor: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: CustomTextWidget(
                              textString: "${itemModels[index].price} TL",
                              fontSize: 15,
                              textColor: ColorConstants.orangeColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
