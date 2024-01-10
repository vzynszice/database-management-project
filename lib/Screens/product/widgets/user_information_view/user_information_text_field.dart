import 'package:flutter/material.dart';
import 'package:vtproje/Screens/product/widgets/home_view/search_text_field.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class UserInformationWidgets extends StatefulWidget {
  const UserInformationWidgets(
      {super.key, required this.userModel, required this.textFieldsForValues});
  final UserModel userModel;
  final bool textFieldsForValues;
  @override
  State<UserInformationWidgets> createState() => _UserInformationWidgetsState();
}

class _UserInformationWidgetsState extends State<UserInformationWidgets> {
  @override
  Widget build(BuildContext context) {
    FocusNode focusNodeTextFieldName = FocusNode();
    FocusNode focusNodeTextFieldPhoneNumber = FocusNode();
    FocusNode focusNodeTextFieldEmail = FocusNode();
    FocusNode focusNodeTextFieldBirthDate = FocusNode();
    FocusNode focusNodeTextFieldAddress = FocusNode();
    FocusNode focusNodeTextFieldBudget = FocusNode();
    List<String> labelStrings = [
      "Name",
      "Phone Number",
      "E-mail",
      "Birth Date",
      "Address",
      "Budget"
    ];
    final List<TextEditingController> _textControllers =
        List.generate(6, (_) => TextEditingController());
    return SizedBox(
      height: widget.textFieldsForValues == true
          ? MediaQuery.of(context).size.longestSide
          : MediaQuery.of(context).size.height * 0.55,
      child: ListView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 7),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                height: widget.textFieldsForValues == true ? 70 : 60,
                child: TextField(
                  controller: _textControllers[index],
                  onChanged: (value) {
                    takingNewValues(index, widget.userModel, value);
                  },
                  onEditingComplete: () {
                    if (widget.textFieldsForValues) {
                      setState(() {
                        _textControllers[index]
                            .clear(); // Clear the text when editing is complete
                        FocusScope.of(context).unfocus();
                      });
                    } /* else {
                        FocusScope.of(context).unfocus();
                      } */
                  },
                  decoration: widget.textFieldsForValues == true
                      ? InputDecorators(labelStrings[index])
                          .usersValues(widget.userModel, index)
                      : InputDecorators(labelStrings[index])
                          .usersInputs(widget.userModel),
                  focusNode: index == 0
                      ? focusNodeTextFieldName
                      : (index == 1
                          ? focusNodeTextFieldPhoneNumber
                          : (index == 2
                              ? focusNodeTextFieldEmail
                              : (index == 3
                                  ? focusNodeTextFieldBirthDate
                                  : (index == 4
                                      ? focusNodeTextFieldAddress
                                      : focusNodeTextFieldBudget)))),
                )),
          );
        },
      ),
    );
  }
}

void takingNewValues(int index, UserModel userModel, String value) {
  if (index == 0) {
    userModel.userName = value;
  } else if (index == 1) {
    userModel.phoneNumber = value;
  } else if (index == 2) {
    userModel.email = value;
  } else if (index == 3) {
    userModel.age = int.parse(value);
  } else if (index == 4) {
    userModel.address = value;
  } else {
    userModel.balance = int.parse(value);
  }
}
