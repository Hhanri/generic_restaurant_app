import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart';
import 'package:generic_restaurant_app/widgets/section_card_widget.dart';

class HomeWidget extends StatelessWidget {
  final List<SectionModel> sections;
  final Design design;
  const HomeWidget({
    Key? key,
    required this.sections,
    required this.design
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      title: "HOME",
      child: Column(
        children: [
          ...sections.map(
            (section) => SectionCardWidget(
              section: section,
            )
          ).toList()
        ],
      ),
      design: design,
    );
  }
}
