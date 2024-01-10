import 'package:flutter/material.dart';

import 'package:vtproje/Screens/user/model/user_model.dart';

class MyProductsAddingSheet extends StatelessWidget {
  const MyProductsAddingSheet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    /* String userName;
  String phoneNumber;
  String email;
  String address;
  String name;
  int age;
  int balance;
  int purchasedItems = 0;
 */

    UserModel userModel = UserModel("", "", "", 20, "", "", 100, 0);
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*  Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: UserInformationWidgets(
              textFieldsForValues: false,
              userModel: userModel,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Save")), */
        ],
      ),
    ]);
  }
}
