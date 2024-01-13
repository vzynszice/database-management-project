import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/product/widgets/home_view/search_text_field.dart';
import 'package:vtproje/product/widgets/user_information_view/user_information_save_button.dart';

class MyProductsAddingSheet extends StatefulWidget {
  const MyProductsAddingSheet(
      {Key? key, required this.dataBaseService, required this.userModel})
      : super(key: key);
  final DataBaseService dataBaseService;
  final UserModel userModel;
  @override
  _MyProductsAddingSheetState createState() => _MyProductsAddingSheetState();
}

class _MyProductsAddingSheetState extends State<MyProductsAddingSheet> {
  List<ItemModel> itemModels = [];
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  FocusNode focusNodeTextFieldName = FocusNode();
  FocusNode focusNodeTextFieldPrice = FocusNode();
  FocusNode focusNodeTextFieldDescription = FocusNode();
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
    return Stack(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 15, left: 15, bottom: 7),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        height: 70,
                        child: TextField(
                          controller: index == 0
                              ? itemNameController
                              : (index == 1
                                  ? itemDescriptionController
                                  : itemPriceController),
                          /* onChanged: (value) async {
                            if (isPressed) {
                              takingNewValues(index, widget.userModel, value);
                              widget.dataBaseService.updateChanges(
                                  widget.userModel, index, value, context);
                            }
                          }, */
                          decoration: InputDecorators(index == 0
                                  ? "Item Name"
                                  : (index == 1
                                      ? "Item Description"
                                      : "Item Price"))
                              .usersInputs(widget.userModel),
                          focusNode: index == 0
                              ? focusNodeTextFieldName
                              : (index == 1
                                  ? focusNodeTextFieldDescription
                                  : focusNodeTextFieldPrice),
                        )),
                  );
                },
              ),
            ),
          ),
          UserInformationSaveButton(
              backgroundColor: ColorConstants.orangeColor,
              buttonText: "Add Item",
              textColor: Colors.white,
              onPressed: () async {
                int itemPrice = int.parse(itemPriceController.text);
                int categoryID;
                String imagePath;
                if (itemNameController.text == 'Handmade Soap') {
                  categoryID = 0;
                  imagePath = 'assets/images/soap.png';
                } else if (itemNameController.text == 'Handmade Bracelet' ||
                    itemNameController.text == 'Handmade Mask' ||
                    itemNameController.text == 'Handmade Bag') {
                  categoryID = 1;
                  if (itemNameController.text == 'Handmade Bracelet') {
                    imagePath = 'assets/images/bracelet.png';
                  } else if (itemNameController.text == 'Handmade Mask') {
                    imagePath = 'assets/images/handmade_mask.png';
                  } else {
                    imagePath = 'assets/images/pink_bag.png';
                  }
                } else {
                  //Basket or Flower Pot
                  categoryID = 2;
                  if (itemNameController.text == 'Handmade Basket') {
                    imagePath = 'assets/images/handmade_basket.png';
                  } else {
                    imagePath = 'assets/images/handmade_flower_pot.png';
                  }
                }
                await widget.dataBaseService.insertNewItem(
                    itemPrice,
                    categoryID,
                    itemNameController.text,
                    itemDescriptionController.text,
                    widget.userModel.userName,
                    imagePath);
                setState(() {});
              })
        ],
      ),
    ]);
  }
}
