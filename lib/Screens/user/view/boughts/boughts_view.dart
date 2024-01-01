import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/product/widgets/home_view/all_products.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';

class BoughtSoldProductsView extends StatefulWidget {
  const BoughtSoldProductsView({super.key, required this.headlineString});
  final String headlineString;
  @override
  State<BoughtSoldProductsView> createState() => _BoughtSoldProductsViewState();
}

class _BoughtSoldProductsViewState extends State<BoughtSoldProductsView> {
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
                child: AllProducts())
          ],
        ),
      ),
    );
  }
}
