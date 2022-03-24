import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/providers/providers.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart';
import 'package:generic_restaurant_app/widgets/section_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final List<SectionModel> sections = ref.watch(restaurantMenuProvider);
        print("building home screen");
        return ScaffoldWidget(
          title: "HOME",
          child: Column(
            children: [
              ...ref.watch(restaurantMenuProvider).map(
                (section) => SectionCardWidget(
                  section: section,
                )
              ).toList()
            ],
          )
        );
      }
    );
  }
}
