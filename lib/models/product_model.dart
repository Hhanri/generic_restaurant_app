import 'package:equatable/equatable.dart';

class ProductModel extends Equatable{
  final String productName;
  final String price;

  ProductModel({
    required this.productName,
    required this.price
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      productName: data["productName"],
      price: data["price"]
    );
  }
  static Map<String, String> toJson(ProductModel model) {
    return {
      "productName" : model.productName,
      "price" : model.price
    };
  }

  static String displayPrice(ProductModel model) {
    return model.price + "€";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productName, price];
}