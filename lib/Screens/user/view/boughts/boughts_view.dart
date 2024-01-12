import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/product/widgets/home_view/all_products.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class BoughtSoldProductsView extends StatefulWidget {
  BoughtSoldProductsView(
      {super.key, required this.headlineString, required this.dataBaseService});
  final String headlineString;
  DataBaseService dataBaseService;

  @override
  State<BoughtSoldProductsView> createState() => _BoughtSoldProductsViewState();
}

class _BoughtSoldProductsViewState extends State<BoughtSoldProductsView> {
  ItemModel itemModel = ItemModel(0, 0, 0, "", 0, "", "", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          textString: widget.headlineString,
          fontSize: 25,
          textColor: ColorConstants.orangeColor,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 1, right: 1),
              child: AllProducts(
                  itemModels: [itemModel],
                  dataBaseService: widget.dataBaseService),
            )
          ],
        ),
      ),
    );
  }
}
