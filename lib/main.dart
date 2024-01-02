import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
//import 'package:vtproje/Screens/filter_menu/filter_menu_view.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';

Future<void> main() async {
  final connection = PostgreSQLConnection(
    '10.0.2.2', // Replace with your PostgreSQL server host
    5432, // Replace with your PostgreSQL server port
    'hobby_market', // Replace with your database name
    username: 'postgres', // Replace with your username
    password: '3469', // Replace with your password
  );
  await connection.open();
  final result = await connection.query('SELECT * FROM items');
  final rows = result.affectedRowCount;
  print(rows);
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
