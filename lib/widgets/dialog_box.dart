import 'package:flutter/material.dart';
import 'package:greengrocer/hive/products.dart';
import 'package:greengrocer/widgets/custom_elevated_button.dart';
import 'package:greengrocer/widgets/custom_text_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
  });

  final productNameController = TextEditingController();
  final productAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade200,
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            CustomTextField(
                controller: productNameController,
                text: 'Product Name',
                prefixIcon: Icons.add_card),
            CustomTextField(
                controller: productAmountController,
                text: 'Enter the amount',
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
                    final myProductBox = Hive.box<ProductList>('productBox');

                    myProductBox.add(ProductList(
                        productName: productNameController.text,
                        amount: int.parse(productAmountController.text)));

                    productNameController.clear();
                    productAmountController.clear();
                    // Call the callback here

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
