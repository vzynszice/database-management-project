import 'package:flutter/material.dart';
import 'package:vtproje/product/widgets/item_information_view/item_text_widget.dart';

class AdvertSlider extends StatelessWidget {
  const AdvertSlider({
    super.key,
    required this.imagePaths,
  });

  final List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
      child: SizedBox(
        height: 220,
        child: PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const ItemTextWidget(
                          textString: "Sale Up To\n%70 Off",
                          fontSize: 25,
                          padding: EdgeInsets.zero,
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ]),
                ),
              );
            }),
      ),
    );
  }
}
