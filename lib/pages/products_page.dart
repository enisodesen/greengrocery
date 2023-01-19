import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:greengrocer/hive/products.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/dialog_box_update.dart';
import '../widgets/dialog_box.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late List<ProductList> _products;
  late Box<ProductList> _box;

  @override
  void initState() {
    super.initState();

    _box = Hive.box<ProductList>('productBox');
    _products = _box.values.toList();
    final x = Hive.box<ProductList>('productBox').listenable();
    x.addListener(() {
      setState(() {
        _products = Hive.box<ProductList>('productBox').values.toList();
      });
    });
  }

  void addNewProduct() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      },
    );
  }

  void updateProduct(int index, ProductList prod) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxUpDate(
          productIndex: index,
          product: prod,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(toolbarHeight: 200, actions: [
        Expanded(
          child: Image.asset(
            'lib/images/products_banner.png',
            fit: BoxFit.cover,
          ),
        ),
      ]),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Slidable(
              endActionPane:
                  ActionPane(motion: const StretchMotion(), children: [
                SlidableAction(
                  onPressed: (context) =>
                      updateProduct(index, _products[index]),
                  backgroundColor: Colors.red.shade700,
                  icon: Icons.update,
                  borderRadius: BorderRadius.circular(12),
                ),
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      _products.removeAt(index);
                      _box.deleteAt(index);
                    });
                  },
                  backgroundColor: Colors.grey.shade700,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(12),
                ),
              ]),
              child: Container(
                color: Colors.yellow.shade200,
                child: ListTile(
                  title: Text('Product: ${_products[index].productName}'),
                  subtitle:
                      Text('Amount: ${_products[index].amount.toString()} kg '),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewProduct,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
