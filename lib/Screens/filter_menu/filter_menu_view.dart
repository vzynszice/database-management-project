import 'package:flutter/material.dart';
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/constants/color_constants.dart';
import 'package:vtproje/Screens/filter_menu/custom_filter_form_field.dart';
import 'package:vtproje/Screens/home_page/all_items.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';
import 'package:vtproje/Screens/item/model/category_model.dart';
<<<<<<< Updated upstream
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';
=======
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';
>>>>>>> Stashed changes
import 'package:vtproje/Screens/shopping_cart/custom_button.dart';

class FilterMenuView extends StatefulWidget {
  const FilterMenuView({
    Key? key,
    required this.dataBaseService,
    required this.onFilterApplied,
  }) : super(key: key);
  final DataBaseService dataBaseService;
  final Function(List<ItemModel>) onFilterApplied;

  @override
  _FilterMenuViewState createState() => _FilterMenuViewState();
}

class _FilterMenuViewState extends State<FilterMenuView> {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  List<CategoryModel> categories = [];
  List<int> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    List<CategoryModel>? categoryNames =
        await widget.dataBaseService.getCategoryNames();
    if (categoryNames != null) {
      setState(() {
        categories = categoryNames
            .map((category) => CategoryModel(
                  category.id,
                  category.name,
                ))
            .toList();
      });
    }
  }

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  _applyFilter();
                },
                child: Container(
                  child: Center(
                      child:
                          CustomTextWidget(textString: "Apply", fontSize: 20)),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorConstants.orangeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
<<<<<<< Updated upstream
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
=======
            ),
          ],
        ),
      ),
>>>>>>> Stashed changes
    );
  }

  void _applyFilter() async {
    List<ItemModel> filteredItems = [];

    if (selectedCategories.isNotEmpty) {
      for (int i = 0; i < selectedCategories.length; i++) {
        List<ItemModel> items = await widget.dataBaseService.getFilteredItems(
          categoryFilter: selectedCategories[i],
          maxPrice: int.tryParse(maxPriceController.text),
          minPrice: int.tryParse(minPriceController.text),
        );
        filteredItems.addAll(items);
      }
    } else {
      List<ItemModel> items = await widget.dataBaseService.getFilteredItems(
        maxPrice: int.tryParse(maxPriceController.text),
        minPrice: int.tryParse(minPriceController.text),
      );
      filteredItems.addAll(items);
    }

    print(filteredItems);

    widget.onFilterApplied(filteredItems);

    Navigator.pop(context);
  }
}
