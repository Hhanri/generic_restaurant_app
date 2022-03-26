import 'package:equatable/equatable.dart';
import 'package:generic_restaurant_app/models/product_model.dart';
import 'package:generic_restaurant_app/services/firebase_services.dart';

class SectionModel extends Equatable{
  final String sectionName;
  final List<ProductModel> products;
  final String cover;

  const SectionModel({
    required this.sectionName,
    required this.products,
    required this.cover
  });

  static Future<SectionModel> fromJson({required Map<String, dynamic> data, required bool fromFirebase}) async {
    return SectionModel(
      sectionName: data["sectionName"],
      products: List<ProductModel>.from(data["products"].map((jsonProduct) => ProductModel.fromJson(jsonProduct))),
      cover: fromFirebase ? await FirebaseServices().downloadURL(data["cover"]) : data["cover"]
    );
  }

  static Map<String, dynamic> toJson(SectionModel model) {
    return {
      "sectionName" : model.sectionName,
      "products" : List<Map<String, dynamic>>.from(model.products.map((product) => ProductModel.toJson(product))),
      "cover" : model.cover
    };
  }

  static Future<List<SectionModel>> listFromJson({required List<dynamic> data, required bool fromFirebase}) async {
    List<SectionModel> result = [];
    for (var element in data) {
      result.add(await fromJson(data: element, fromFirebase: fromFirebase));
    }
    return result;
  }

  static List<Map<String, dynamic>> listToJson(List<SectionModel> listModel) {
    return List<Map<String, dynamic>>.from(listModel.map((section) => toJson(section)));
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sectionName, products, cover];
}