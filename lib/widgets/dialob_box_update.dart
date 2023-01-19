import 'package:flutter/material.dart';
import 'package:greengrocer/hive/products.dart';
import 'package:greengrocer/widgets/custom_elevated_button.dart';
import 'package:greengrocer/widgets/custom_text_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DialogBoxUpDate extends StatelessWidget {
  DialogBoxUpDate({
    super.key,
    required this.product,
    required this.productIndex,
  });
  final ProductList product;
  final int productIndex;
  final productAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade200,
      content: SizedBox(
        height: 170,
        child: Column(
          children: [
            CustomTextField(
                controller: productAmountController,
                text: 'Enter the new amount',
                prefixIcon: Icons.add,
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                CustomElevatedButton(
                  text: 'Save',
                  onPressed: () {
                    final myExistingProduct =
                        Hive.box<ProductList>('productBox');
                    myExistingProduct.putAt(
                        productIndex,
                        ProductList(
                            productName: product.productName,
                            amount: int.parse(productAmountController.text)));
                    productAmountController.clear();
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomElevatedButton(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
