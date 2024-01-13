import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/product/widgets/home_view/all_products.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

// ignore: must_be_immutable
class SoldsProductsView extends StatefulWidget {
  SoldsProductsView(
      {super.key,
      required this.headlineString,
      required this.dataBaseService,
      required this.userModel});
  final String headlineString;
  DataBaseService dataBaseService;
  final UserModel userModel;
  @override
  State<SoldsProductsView> createState() => _SoldsProductsViewState();
}

class _SoldsProductsViewState extends State<SoldsProductsView> {
  List<ItemModel> itemModels = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    itemModels =
        await widget.dataBaseService.getSoldItems(widget.userModel.userName);
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
