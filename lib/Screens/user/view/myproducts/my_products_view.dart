import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/product/widgets/home_view/all_products.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';
import 'package:vtproje/Screens/product/widgets/my_products_view/my_products_view_adding.dart';

class MyProductsView extends StatefulWidget {
  const MyProductsView({super.key, required this.headlineString});
  final String headlineString;

  @override
  State<MyProductsView> createState() => _MyProductsViewState();
}

class _MyProductsViewState extends State<MyProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.orangeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: ColorConstants.greyTransparent,
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const FractionallySizedBox(
                    heightFactor: 0.7, child: MyProductsAddingSheet());
              });
        },
      ),
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
                child: AllProducts())
          ],
        ),
      ),
    );
  }
}
