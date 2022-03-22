import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/widgets/product_tile_widget.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart';

class SectionScreen extends StatelessWidget {
  final SectionModel section;
  const SectionScreen({
    Key? key,
    required this.section
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      title: section.sectionName,
      child: Column(
        children: [
          ...section.products.map(
            (product) => ProductTileWidget(product: product)
          ).toList()
        ]
      )
    );
  }
}
