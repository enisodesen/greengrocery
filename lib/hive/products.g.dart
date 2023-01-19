// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductListAdapter extends TypeAdapter<ProductList> {
  @override
  final int typeId = 2;

  @override
  ProductList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductList(
      productName: fields[0] as String,
      amount: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
