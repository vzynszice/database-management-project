import 'package:flutter/material.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_cart_body.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_cart_empty.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_list.dart';

<<<<<<< Updated upstream
class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});
=======
class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key, required this.dataBaseService})
      : super(key: key);

  final DataBaseService dataBaseService;

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  bool value = false;

  void changeData() {
    setState(() {
      value = !value; // Değeri tersine çevirerek güncelleme yapabilirsiniz.
    });
  }

  void onDelete(PurchasedItemModel item) {
    setState(() {
      Shop.purchasedItems.remove(item);
      changeData(); // Shop.purchasedItems değiştiğinde güncelleme yap
    });
  }
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    double shippingFee = 30;
    double price = 100;
    double total = shippingFee + price;
    List<PurchasedItemModel>? purchasedItems = [
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          5),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          2),
      PurchasedItemModel(
          ItemModel(
              5,
              100,
              "Handmade Candle",
              47,
              "skldnfkdsnflkdsnfdsf dskjfdsjfbskdjfb skdjfnkjdsfbkjdfbsdf",
              "Batuhan",
              "assets/images/soap.png"),
          5)
    ];

    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomTextWidget(textString: "Shopping Cart", fontSize: 22),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xfff5f6f8),
        body: purchasedItems.isEmpty
            ? ShoppingCarEmpty()
            : ShoppingCartBody(
<<<<<<< Updated upstream
                purchasedItems: purchasedItems,
=======
                purchasedItems: Shop.purchasedItems,
                onDelete: onDelete,
                dataBaseService: widget.dataBaseService,
                key: ValueKey(value), // key'i değiştirerek yeniden oluştur
>>>>>>> Stashed changes
              ),
      ),
    );
  }
}
