import 'package:generic_restaurant_app/models/section_model.dart';

List<Map<String, dynamic>> test =
[
  {
    "sectionName" : "TEST1",
    "cover" : "assets/dessert.jpg",
    "products" : [
      {
        "productName" : "product1",
        "price" : "13"
      },
      {
        "productName" : "product2",
        "price" : "12"
      }
    ]
  },
  {
    "sectionName" : "TEST2",
    "cover" : "assets/plate.jpg",
    "products" : [
      {
        "productName" : "product3",
        "price" : "15"
      },
      {
        "productName" : "product4",
        "price" : "16"
      }
    ]
  },
  {
    "sectionName" : "TEST2",
    "cover" : "assets/plate.jpg",
    "products" : [
      {
        "productName" : "product3",
        "price" : "15"
      },
      {
        "productName" : "product4",
        "price" : "16"
      }
    ]
  },
  {
    "sectionName" : "TEST2",
    "cover" : "assets/plate.jpg",
    "products" : [
      {
        "productName" : "product3",
        "price" : "15"
      },
      {
        "productName" : "product4",
        "price" : "16"
      }
    ]
  },
];
final List<SectionModel> dummy = SectionModel.listFromJson(test);
final testVerif = SectionModel.listToJson(dummy);