import 'package:hive/hive.dart';

part 'products.g.dart';

@HiveType(typeId: 2)
class ProductList {
  ProductList({required this.productName, required this.amount});
  @HiveField(0)
  String productName;

  @HiveField(1)
  int amount;
}
