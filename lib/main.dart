import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:vtproje/Screens/filter_menu/filter_menu_view.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';
=======
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/home_page/all_items.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';
//import 'package:vtproje/Screens/filter_menu/filter_menu_view.dart';
import 'package:vtproje/Screens/login/login_view.dart';
import 'package:vtproje/Screens/register/register_view.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
>>>>>>> Stashed changes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /* ItemModel itemModel = ItemModel(
        123456,
        380,
        "Hanmade Soap",
        4,
        "Hdlkdsfndskfndsfndsnfdsfkds dksjfndnjfkdnfds skdjfnsjdf skdjnksjdnf sjdkfnsdf xddvfd ddsfds dfdfdfdf djbfkjdbfksjdbfkdf lksfnkjdsf dkjsfbdj djfbdsjfb ",
        "Ayse",
<<<<<<< Updated upstream
        "assets/images/soap.png");
    UserModel userModel = UserModel(
        "Beyza",
        "0122555555",
        "beyzaokatan@gmail.com",
        "20.01.2002",
        "Gençosman Mah. Ensar Cad. Güngören/İstanbul",
        500,
        0);  */ //Item Information Viewlar için yazıldı
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
=======
        "assets/images/soap.png");*/
    UserModel userModel = UserModel("Beyza", "letmein", "beyzaokatan@gmail.com",
        15, "Gençosman Mah. Ensar Cad. Güngören/İstanbul", "a", 500, 0);
    DataBaseService.userModel = userModel;
    DataBaseService dataBaseService = DataBaseService();
    dataBaseService.connectToDatabase();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(userModel: userModel, dataBaseService: dataBaseService));
>>>>>>> Stashed changes
  }
}
