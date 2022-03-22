import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/models/product_model.dart';
import 'package:generic_restaurant_app/models/section_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> test = {
      "sectionName" : "TEST",
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
    };
    final dummy = SectionModel.fromJson(test);
    final testVerif = SectionModel.toJson(dummy);
    print(dummy == SectionModel.fromJson(testVerif));

    return Scaffold(
      appBar: AppBar(),
      body: Center()
    );
  }
}
