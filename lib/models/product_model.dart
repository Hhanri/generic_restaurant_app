import 'package:equatable/equatable.dart' show Equatable;
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;

class ProductModel extends Equatable{
  final String productName;
  final String price;

  const ProductModel({
    required this.productName,
    required this.price
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      productName: data[AppConstants.productName],
      price: data[AppConstants.price]
    );
  }
  static Map<String, String> toJson(ProductModel model) {
    return {
      AppConstants.productName : model.productName,
      AppConstants.price : model.price
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productName, price];
}

extension DisplayPrice on ProductModel {
  String getPrice() {
    return price + "€";
  }
}