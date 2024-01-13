import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/product/widgets/home_view/all_products.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class BestSellers extends StatefulWidget {
  final DataBaseService dataBaseService;

  BestSellers({required this.dataBaseService});

  @override
  State<BestSellers> createState() => _BestSellersState();
}

class _BestSellersState extends State<BestSellers> {
  late List<ItemModel> itemModels;

  @override
  void initState() {
    super.initState();
    _loadBestSellingProducts();
  }

  Future<void> _loadBestSellingProducts() async {
    List<ItemModel> products =
        await widget.dataBaseService.getBestSellingProducts();
    setState(() {
      itemModels = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          textString: "Best Selling Products",
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
                itemModels: itemModels ?? [], // Null kontrolü ekledim
                dataBaseService: widget.dataBaseService,
              ),
            )
          ],
        ),
      ),
    );
  }
}
