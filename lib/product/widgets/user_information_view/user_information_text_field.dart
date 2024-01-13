import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/product/widgets/home_view/search_text_field.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';
import 'package:vtproje/product/widgets/user_information_view/user_information_save_button.dart';

class UserInformationWidgets extends StatefulWidget {
  const UserInformationWidgets({
    super.key,
    required this.userModel,
    required this.textFieldsForValues,
    required this.dataBaseService,
  });
  final UserModel userModel;
  final bool textFieldsForValues;
  final DataBaseService dataBaseService;
  @override
  State<UserInformationWidgets> createState() => _UserInformationWidgetsState();
}

class _UserInformationWidgetsState extends State<UserInformationWidgets> {
  bool isPressed = false;
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
    return Column(
      children: [
        SizedBox(
          height: widget.textFieldsForValues == true
              ? MediaQuery.of(context).size.longestSide * 0.7
              : MediaQuery.of(context).size.height * 0.55,
          child: ListView.builder(
            physics: widget.textFieldsForValues == true
                ? const NeverScrollableScrollPhysics()
                : null,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 15, left: 15, bottom: 7),
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    height: widget.textFieldsForValues == true ? 70 : 60,
                    child: TextField(
                      controller: _textControllers[index],
                      onChanged: (value) async {
                        if (isPressed) {
                          takingNewValues(index, widget.userModel, value);
                          widget.dataBaseService.updateChanges(
                              widget.userModel, index, value, context);
                        }
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
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: UserInformationSaveButton(
              backgroundColor: ColorConstants.orangeColor,
              buttonText: "Save",
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  isPressed = true;
                });
              }),
        )
      ],
    );
  }
}

void saveTheChanegs(UserModel userModel, DataBaseService dataBaseService,
    int index, String value, BuildContext context) {
  takingNewValues(index, userModel, value);
  dataBaseService.updateChanges(userModel, index, value, context);
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
