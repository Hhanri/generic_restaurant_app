import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/data.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart';
import 'package:generic_restaurant_app/widgets/section_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      title: "HOME",
      child: Column(
        children: [
          ...dummy.map(
            (section) => SectionCardWidget(
              section: section,
            )
          ).toList()
        ],
      )
    );
  }
}
