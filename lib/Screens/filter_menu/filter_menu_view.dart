import 'package:flutter/material.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/filter_menu/custom_filter_form_field.dart';
import 'package:vtproje/Screens/item/model/category_model.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';
import 'package:vtproje/Screens/shopping_cart/custom_button.dart';

class FilterMenuView extends StatefulWidget {
  const FilterMenuView({Key? key}) : super(key: key);

  @override
  _FilterMenuViewState createState() => _FilterMenuViewState();
}

class _FilterMenuViewState extends State<FilterMenuView> {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  final List<CategoryModel> categories = [
    CategoryModel(1, "aasdsa"),
    CategoryModel(2, "aasdsa"),
    CategoryModel(3, "aasdsa"),
    CategoryModel(4, "aasdsa"),
    CategoryModel(7, "aasdsa"),
    CategoryModel(5, "aaererwerwsdsa"),
    CategoryModel(10, "aasdsa"),
  ];
  List<int> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: CustomTextWidget(textString: "Filter", fontSize: 22),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: const Color(0xfff5f6f8),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextWidget(
                        textString: "Price",
                        fontSize: 20,
                        textColor: ColorConstants.orangeColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomFilterFormField(
                                text: "min", controller: minPriceController),
                            CustomFilterFormField(
                                text: "max", controller: maxPriceController),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: CustomTextWidget(
                          textString: "Categories",
                          fontSize: 20,
                          textColor: ColorConstants.orangeColor,
                        ),
                      ),
                      Wrap(
                        children: categories
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: FilterChip(
                                    shape: LinearBorder(
                                        bottom: LinearBorderEdge(size: 0)),
                                    label: CustomTextWidget(
                                      textString: e.name,
                                      fontSize: 15,
                                      textColor: Colors.grey.shade700,
                                    ),
                                    selected: selectedCategories.contains(e.id),
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          selectedCategories.add(e.id);
                                        } else {
                                          selectedCategories.remove(e.id);
                                        }
                                      });
                                    },
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: CustomButton(buttonText: "Apply"),
                  )),
            ],
          )),
    );
  }
}
