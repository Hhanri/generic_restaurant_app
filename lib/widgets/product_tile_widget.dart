import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/models/product_model.dart' show ProductModel, DisplayPrice;

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  const ProductTileWidget({
    Key? key,
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.productName),
      trailing: Text(product.getPrice()),
      dense: true,
    );
  }
}
