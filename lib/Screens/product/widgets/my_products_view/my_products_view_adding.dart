import 'package:flutter/material.dart';
import 'package:vtproje/Screens/product/widgets/user_information_view/user_information_text_field.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class MyProductsAddingSheet extends StatelessWidget {
  const MyProductsAddingSheet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel("", "", "", "", "", 0, 0);
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: UserInformationWidgets(
              textFieldsForValues: false,
              userModel: userModel,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Save")),
        ],
      ),
    ]);
  }
}
