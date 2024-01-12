import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/product/widgets/user_information_view/user_information_text_field.dart';

class MyProductsAddingSheet extends StatefulWidget {
  const MyProductsAddingSheet({Key? key, required this.dataBaseService})
      : super(key: key);
  final DataBaseService dataBaseService;
  @override
  _MyProductsAddingSheetState createState() => _MyProductsAddingSheetState();
}

class _MyProductsAddingSheetState extends State<MyProductsAddingSheet> {
  List<ItemModel> itemModels = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    itemModels = await widget.dataBaseService.getFilteredItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel("", "", "", 20, "", "", 100, 0);

    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: UserInformationWidgets(
              textFieldsForValues: false,
              userModel: userModel,
              dataBaseService: widget.dataBaseService,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Save")),
        ],
      ),
    ]);
  }
}
