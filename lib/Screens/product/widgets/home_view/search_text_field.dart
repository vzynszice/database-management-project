import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.focusNodeTextFieldOne,
  });

  final FocusNode focusNodeTextFieldOne;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        focusNode: focusNodeTextFieldOne,
        decoration: InputDecorators("").emailInput(),
      ),
    );
  }
}

class InputDecorators {
  final String labelString;
  InputDecorators(this.labelString);

  InputDecoration emailInput() {
    return const InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      hintText: 'Search...',
      hintStyle: TextStyle(color: Colors.grey),
      fillColor: Colors.white,
      suffixIcon: Icon(
        Icons.search,
        color: Colors.grey,
      ),
      filled: true,
    );
  }

  InputDecoration usersValues(UserModel userModel, int index) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      helperText: index == 0
          ? userModel.userName
          : (index == 1
              ? userModel.phoneNumber
              : (index == 2
                  ? userModel.email
                  : (index == 3
                      ? userModel.age.toString()
                      : (index == 4
                          ? userModel.address
                          : userModel.balance.toString())))),
      helperStyle: const TextStyle(
          color: Colors.grey, fontSize: 13, fontFamily: 'Francois One'),
      labelText: labelString,
      labelStyle: const TextStyle(
          color: ColorConstants.orangeColor,
          fontSize: 18,
          fontFamily: 'Francois One',
          fontWeight: FontWeight.w100),
      fillColor: Colors.white,
      filled: true,
    );
  }

  InputDecoration usersInputs(UserModel userModel) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      labelText: labelString,
      labelStyle: const TextStyle(
          color: ColorConstants.orangeColor,
          fontSize: 15,
          fontFamily: 'Francois One',
          fontWeight: FontWeight.w100),
      fillColor: Colors.white,
      filled: true,
    );
  }
}
