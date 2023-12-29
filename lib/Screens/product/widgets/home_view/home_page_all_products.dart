import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/product/widgets/item_information_view/item_text_widget.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.itemModels});
  final List<ItemModel> itemModels;
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
                crossAxisCount: 2, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 350,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          itemModels[index].imagePath,
                          fit: BoxFit.fitWidth,
                          height: 125,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 8),
                        child: ItemTextWidget(
                          textString: itemModels[index].name,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: ItemTextWidget(
                              textString: itemModels[index].seller,
                              fontSize: 10,
                              textColor: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: ItemTextWidget(
                              textString: "${itemModels[index].price} TL",
                              fontSize: 15,
                              textColor: ColorConstants.orangeColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
