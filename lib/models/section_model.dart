import 'package:equatable/equatable.dart';
import 'package:generic_restaurant_app/models/product_model.dart';

class SectionModel extends Equatable{
  final String sectionName;
  final List<ProductModel> products;

  SectionModel({
    required this.sectionName,
    required this.products
  });

  factory SectionModel.fromJson(Map<String, dynamic> data) {
    return SectionModel(
      sectionName: data["sectionName"],
      products: List<ProductModel>.from(data["products"].map((element) => ProductModel.fromJson(element)))
    );
  }

  static Map<String, dynamic> toJson(SectionModel model) {
    return {
      "sectionName" : model.sectionName,
      "products" : List<Map<String, dynamic>>.from(model.products.map((e) => ProductModel.toJson(e)))
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sectionName, products];
}