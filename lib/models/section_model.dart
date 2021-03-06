import 'package:equatable/equatable.dart' show Equatable;
import 'package:generic_restaurant_app/models/product_model.dart' show ProductModel;
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;
import 'package:generic_restaurant_app/services/firebase_services.dart' show FirebaseServices;

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
      sectionName: data[AppConstants.sectionName],
      products: List<ProductModel>.from(data[AppConstants.products].map((jsonProduct) => ProductModel.fromJson(jsonProduct))),
      cover: fromFirebase ? await FirebaseServices().downloadURL(data[AppConstants.cover]) : data[AppConstants.cover]
    );
  }

  static Map<String, dynamic> toJson(SectionModel model) {
    return {
      AppConstants.sectionName : model.sectionName,
      AppConstants.products : List<Map<String, dynamic>>.from(model.products.map((product) => ProductModel.toJson(product))),
      AppConstants.cover : model.cover
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