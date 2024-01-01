import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';
import 'package:vtproje/Screens/product/widgets/user_information_view/user_information_button_widget.dart';
import 'package:vtproje/Screens/product/widgets/user_information_view/user_information_text_field.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class UserInformationView extends StatefulWidget {
  const UserInformationView({super.key, required this.userModel});
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
    _tabController.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.greyTransparent,
      bottomNavigationBar: BottomAppBar(child: _myTabView()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserInformationButton(
                    buttonSubline: "Boughts",
                    buttonIcon: Icons.shopping_cart_checkout,
                    index: 0,
                  ),
                  UserInformationButton(
                    buttonSubline: "Solds",
                    buttonIcon: Icons.shopify_outlined,
                    index: 1,
                  ),
                  UserInformationButton(
                    buttonSubline: "My Products",
                    buttonIcon: Icons.window_sharp,
                    index: 2,
                  )
                ],
              ),
            ),
            UserInformationWidgets(
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
                userModel: widget.userModel,
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
