import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/product/widgets/home_view/all_products.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

// ignore: must_be_immutable
class BoughtProductsView extends StatefulWidget {
  BoughtProductsView(
      {super.key,
      required this.headlineString,
      required this.dataBaseService,
      required this.userModel});
  final String headlineString;
  DataBaseService dataBaseService;
  final UserModel userModel;
  @override
  State<BoughtProductsView> createState() => _BoughtProductsViewState();
}

class _BoughtProductsViewState extends State<BoughtProductsView> {
  List<ItemModel> itemModels = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    itemModels = await widget.dataBaseService
        .getPurchasedItems(widget.userModel.userName);
    setState(() {});
  }

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
                  myProductsPage: false,
                  itemModels: itemModels,
                  dataBaseService: widget.dataBaseService),
            )
          ],
        ),
      ),
    );
  }
}
