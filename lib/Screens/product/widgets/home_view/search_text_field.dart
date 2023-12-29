import 'package:flutter/material.dart';

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
        decoration: _InputDecorator().emailInput,
      ),
    );
  }
}

class _InputDecorator {
  final emailInput = const InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius:
            BorderRadius.all(Radius.circular(10))), //textFieldı kutu içine alır
    hintText: 'Search...', //Boşluğun içine yazar
    hintStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.white, //background rengi
    suffixIcon: Icon(
      Icons.search,
      color: Colors.grey,
    ),
    filled: true,
  );
}
