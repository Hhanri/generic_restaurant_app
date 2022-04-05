import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_restaurant_app/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:generic_restaurant_app/models/section_model.dart' show SectionModel;
import 'package:generic_restaurant_app/resources/theme.dart' show Design;
import 'package:generic_restaurant_app/widgets/product_tile_widget.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart';

class SectionScreen extends StatelessWidget {
  final SectionModel section;
  const SectionScreen({
    Key? key,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final Design design = BlocProvider.of<RestaurantBloc>(context).config.design;
        return ScaffoldWidget(
          parameters: SectionScaffoldWidgetParameters(
            title: section.sectionName,
            design: design,
            child: Column(
              children: [
                ...section.products.map(
                  (product) => ProductTileWidget(product: product)
                ).toList()
              ]
            )
          )
        );
  }
}
