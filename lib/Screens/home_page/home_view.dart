import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/product/widgets/home_view/advert_slider.dart';
import 'package:vtproje/Screens/product/widgets/home_view/home_page_all_products.dart';
import 'package:vtproje/Screens/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/product/widgets/home_view/search_text_field.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
  final PageController _pageController = PageController();
  List<String> imagePaths = [
    "assets/images/vase.jpg",
    "assets/images/vase_hanmade.jpg",
    "assets/images/candle_holder.jpg",
  ];
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
  final UserModel userModel = UserModel(
      "Batuhan",
      "121543133",
      "batuhan@outlook.com",
      "20.02.2003",
      "Şehitlik Mah. 13 Eylül Cad. Kadı Sok. 5/7 Daire No:3 Polatlı/ANKARA",
      780,
      0);
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyTransparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const ItemTextWidget(
            textString: "Explore", fontSize: 22, padding: EdgeInsets.all(1)),
      ),
      bottomNavigationBar: BottomAppBar(child: _myTabView()),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(focusNodeTextFieldOne: focusNodeTextFieldOne),
              AdvertSlider(imagePaths: imagePaths),
              const ItemTextWidget(
                textString: "All Products",
                fontSize: 23,
                padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                textColor: ColorConstants.orangeColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: AllProducts(itemModels: itemModels),
              )
            ],
          ),
        ),
      ]),
    );
  }

  TabBar _myTabView() {
    return TabBar(
      padding: EdgeInsets.zero,
      indicatorColor: ColorConstants.orangeColor,
      controller: _tabController,
      labelColor: ColorConstants.orangeColor,
      unselectedLabelColor: Colors.black,
      onTap: (int index) {},
      tabs: _MyTabViews.values
          .map((e) => Tab(
                icon: e.index == 0
                    ? const Icon(Icons.person_outline)
                    : (e.index == 1
                        ? const Icon(Icons.home_outlined)
                        : const Icon(Icons.shopping_cart_outlined)),
              ))
          .toList(),
    );
  }
}

enum _MyTabViews { profile, home, shoppings }

extension _MyTabViewExtension on _MyTabViews {}
