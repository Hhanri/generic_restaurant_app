import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/providers/providers.dart';
import 'package:generic_restaurant_app/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final AppSettings settings = ref.watch(appSettingsProvider);
        final List<SectionModel> sections = ref.watch(restaurantMenuProvider);
        return HomeWidget(sections: sections, settings: settings);
      }
    );
  }
}
