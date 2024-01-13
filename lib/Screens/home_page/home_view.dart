import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/filter_menu/filter_menu_view.dart';
import 'package:vtproje/Screens/home_page/all_items.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
<<<<<<< Updated upstream
import 'package:vtproje/Screens/product/widgets/home_view/advert_slider.dart';
import 'package:vtproje/Screens/product/widgets/home_view/all_products.dart';
import 'package:vtproje/Screens/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/Screens/product/widgets/home_view/search_text_field.dart';
=======
import 'package:vtproje/Screens/user/view/best_selling_product_view.dart';
import 'package:vtproje/product/widgets/home_view/advert_slider.dart';
import 'package:vtproje/product/widgets/home_view/all_products.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';
>>>>>>> Stashed changes
import 'package:vtproje/Screens/shopping_cart/shopping_cart_view.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/Screens/user/view/user_information_view.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';

class HomeView extends StatefulWidget {
<<<<<<< Updated upstream
  const HomeView({super.key});
=======
  const HomeView({
    super.key,
    required this.userModel,
    required this.dataBaseService,
  });
  final UserModel userModel;
  final DataBaseService dataBaseService;
>>>>>>> Stashed changes

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
  final PageController _pageController = PageController(initialPage: 1);
  List<String> imagePaths = [
    "assets/images/vase.jpg",
    "assets/images/vase_hanmade.jpg",
    "assets/images/candle_holder.jpg",
  ];
<<<<<<< Updated upstream
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
=======
>>>>>>> Stashed changes
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
    _tabController.index = 1;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
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
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        try {
                          List<ItemModel> filteredItems =
                              await widget.dataBaseService.getAllItems();

                          setState(() {});
                        } catch (e) {
                          print('Error in onTap: $e');
                        }
                      },
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.border_all_outlined),
                            ),
                            CustomTextWidget(
                                textString: "All Products", fontSize: 15)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        bool val = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterMenuView(
                              dataBaseService: widget.dataBaseService,
                              onFilterApplied: (filteredItems) {
                                setState(() {
                                  allItems.items.clear();
                                  allItems.items.addAll(filteredItems);
                                });
                              },
                            ),
                          ),
                        );
                        if (val) {
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.filter_list),
                            ),
                            CustomTextWidget(textString: "Filter", fontSize: 15)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BestSellers(
                          dataBaseService: widget.dataBaseService,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: ColorConstants.orangeColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.grade),
                        ),
                        CustomTextWidget(
                            textString: "Best Selling Products", fontSize: 15)
                      ],
                    ),
                  ),
                ),
              ),
              AdvertSlider(imagePaths: imagePaths),
              const ItemTextWidget(
                textString: "Products",
                fontSize: 23,
                padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                textColor: ColorConstants.orangeColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
<<<<<<< Updated upstream
                child: AllProducts(),
=======
                child: AllProducts(
                  itemModels: allItems.items,
                  dataBaseService: widget.dataBaseService,
                ),
>>>>>>> Stashed changes
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
      onTap: (int index) {
        if (index == 1) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const HomeView();
            },
          ));
        } else if (index == 0) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return UserInformationView(
                userModel: userModel,
              );
            },
          ));
        } else if (index == 2) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ShoppingCartView();
            },
          ));
        }
      },
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
