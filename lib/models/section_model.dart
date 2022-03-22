import 'package:equatable/equatable.dart';
import 'package:generic_restaurant_app/models/product_model.dart';

class SectionModel extends Equatable{
  final String sectionName;
  final List<ProductModel> products;

  const SectionModel({
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

  static List<SectionModel> listFromJson(List<Map<String, dynamic>> data) {
    return List<SectionModel>.from(data.map((e) => SectionModel.fromJson(e)));
  }

  static List<Map<String, dynamic>> listToJson(List<SectionModel> listModel) {
    return List<Map<String, dynamic>>.from(listModel.map((e) => toJson(e)));
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sectionName, products];
}