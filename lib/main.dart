import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
//import 'package:vtproje/Screens/filter_menu/filter_menu_view.dart';
import 'package:vtproje/Screens/login/login_view.dart';

Future<void> main() async {
  DataBaseService dataBaseService = DataBaseService();
  await dataBaseService.connectToDatabase();
  runApp(MyApp(
    dataBaseService: dataBaseService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dataBaseService});
  final DataBaseService dataBaseService;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInView(
        dataBaseService: dataBaseService,
      ),
    );
  }
}
