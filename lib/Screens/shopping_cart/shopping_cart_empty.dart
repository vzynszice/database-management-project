import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:vtproje/Screens/product/widgets/login/custom_text_widget.dart';
=======
import 'package:vtproje/Database/database_service.dart';
import 'package:vtproje/Screens/home_page/all_items.dart';
import 'package:vtproje/Screens/home_page/home_view.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';
>>>>>>> Stashed changes
import 'package:vtproje/Screens/shopping_cart/custom_button.dart';

class ShoppingCarEmpty extends StatelessWidget {
  const ShoppingCarEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Image.asset(
          'assets/images/shopping_cart.png',
          height: 200,
        ),
      ),
      CustomTextWidget(
        textString: "Your shopping cart is empty",
        fontSize: 18,
        textColor: Colors.grey.shade500,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: CustomTextWidget(
          textString: "Fortunately, there's an easy solution.",
          fontSize: 20,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CustomButton(buttonText: "Go Shopping"),
      ),
    ]);
  }
}
