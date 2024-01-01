import 'package:flutter/material.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';

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
  }
}
