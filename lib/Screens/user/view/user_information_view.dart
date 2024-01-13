import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';
import 'package:vtproje/Screens/shopping_cart/shopping_cart_view.dart';
import 'package:vtproje/product/widgets/user_information_view/user_information_button_widget.dart';
import 'package:vtproje/product/widgets/user_information_view/user_information_text_field.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class UserInformationView extends StatefulWidget {
  const UserInformationView(
      {super.key, required this.dataBaseService, required this.userModel});
  final DataBaseService dataBaseService;
  final UserModel userModel;

  @override
  State<UserInformationView> createState() => _UserInformationViewState();
}

class _UserInformationViewState extends State<UserInformationView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(child: _myTabView()),
      backgroundColor: ColorConstants.greyTransparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserInformationButton(
                    userModel: widget.userModel,
                    buttonSubline: "Boughts",
                    buttonIcon: Icons.shopping_cart_checkout,
                    index: 0,
                    dataBaseService: widget.dataBaseService,
                  ),
                  UserInformationButton(
                    userModel: widget.userModel,
                    buttonSubline: "Solds",
                    buttonIcon: Icons.shopify_outlined,
                    index: 1,
                    dataBaseService: widget.dataBaseService,
                  ),
                  UserInformationButton(
                    userModel: widget.userModel,
                    buttonSubline: "My Products",
                    buttonIcon: Icons.window_sharp,
                    index: 2,
                    dataBaseService: widget.dataBaseService,
                  )
                ],
              ),
            ),
            UserInformationWidgets(
              dataBaseService: widget.dataBaseService,
              textFieldsForValues: true,
              userModel: widget.userModel,
            ),
          ],
        ),
      ),
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
