import 'package:equatable/equatable.dart';
import 'package:generic_restaurant_app/models/product_model.dart';

class SectionModel extends Equatable{
  final String sectionName;
  final List<ProductModel> products;
  final String cover;

  const SectionModel({
    required this.sectionName,
    required this.products,
    required this.cover
  });

  factory SectionModel.fromJson(Map<String, dynamic> data) {
    return SectionModel(
      sectionName: data["sectionName"],
      products: List<ProductModel>.from(data["products"].map((jsonProduct) => ProductModel.fromJson(jsonProduct))),
      cover: data["cover"]
    );
  }

  static Map<String, dynamic> toJson(SectionModel model) {
    return {
      "sectionName" : model.sectionName,
      "products" : List<Map<String, dynamic>>.from(model.products.map((product) => ProductModel.toJson(product))),
      "cover" : model.cover
    };
  }

  static List<SectionModel> listFromJson(List<Map<String, dynamic>> data) {
    return List<SectionModel>.from(data.map((jsonSection) => SectionModel.fromJson(jsonSection)));
  }

  static List<Map<String, dynamic>> listToJson(List<SectionModel> listModel) {
    return List<Map<String, dynamic>>.from(listModel.map((section) => toJson(section)));
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sectionName, products, cover];
}