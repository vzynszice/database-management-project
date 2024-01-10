import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';

// ignore: must_be_immutable
class AllProducts extends StatelessWidget {
  final List<ItemModel> itemModels;

  AllProducts({Key? key, required this.itemModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.longestSide,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: ScrollController(keepScrollOffset: false),
          itemCount: itemModels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
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
                        child: FutureBuilder<String>(
                          future: DataBaseService()
                              .getSellerName(itemModels[index].sellerUsername),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return CustomTextWidget(
                                textString: snapshot.data ?? '',
                                fontSize: 11,
                                textColor: Colors.grey,
                              );
                            } else {
                              return CircularProgressIndicator(); // You can replace this with a loading indicator
                            }
                          },
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
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
