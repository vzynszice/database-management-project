import 'package:flutter/material.dart';
import 'package:vtproje/product/widgets/login/custom_text_widget.dart';
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
      const Padding(
        padding: EdgeInsets.only(top: 8),
        child: CustomTextWidget(
          textString: "Fortunately, there's an easy solution.",
          fontSize: 20,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 50),
        child: CustomButton(buttonText: "Go Shopping"),
      ),
    ]);
  }
}
