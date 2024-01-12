import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
//import 'package:flutter/services.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/product/widgets/home_view/advert_slider.dart';
import 'package:vtproje/product/widgets/home_view/all_products.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';
import 'package:vtproje/product/widgets/home_view/search_text_field.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_cart_view.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/Screens/user/view/user_information_view.dart';

class HomeView extends StatefulWidget {
  const HomeView(
      {super.key, required this.userModel, required this.dataBaseService});
  final UserModel userModel;
  final DataBaseService dataBaseService;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
  List<String> imagePaths = [
    "assets/images/vase.jpg",
    "assets/images/vase_hanmade.jpg",
    "assets/images/candle_holder.jpg",
  ];
  List<ItemModel> itemModels = [];
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
    _tabController.index = 1;
    fetchData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData();
  }

  void fetchData() async {
    itemModels = await widget.dataBaseService.getFilteredItems();
    setState(() {});
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
                child: AllProducts(
                  itemModels: itemModels,
                  dataBaseService: widget.dataBaseService,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  TabBar _myTabView() {
    return TabBar(
      isScrollable: false,
      padding: EdgeInsets.zero,
      indicatorColor: ColorConstants.orangeColor,
      controller: _tabController,
      labelColor: ColorConstants.orangeColor,
      unselectedLabelColor: Colors.black,
      onTap: (int index) {
        if (index == 1) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return HomeView(
                userModel: widget.userModel,
                dataBaseService: widget.dataBaseService,
              );
            },
          ));
        } else if (index == 0) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return UserInformationView(
                dataBaseService: widget.dataBaseService,
                userModel: widget.userModel,
              );
            },
          ));
        } else if (index == 2) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ShoppingCartView(
                dataBaseService: widget.dataBaseService,
              );
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
