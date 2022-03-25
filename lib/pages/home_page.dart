import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/providers/providers.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:generic_restaurant_app/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final Design design = ref.watch(appSettingsProvider).design;
        final bool hasInternet = ref.watch(connectivityProvider);
        final List<SectionModel> sections = ref.watch(restaurantMenuProvider);
        if (!hasInternet) {
          return HomeWidget(sections: sections, design: design);
        }
        return StreamBuilder(
          stream: ref.watch(firebaseProvider).allRestaurantMenu,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final List<SectionModel> sectionsFromNetwork = SectionModel.listFromJson(snapshot.data[AppConstants.restaurantMenu]);
              return HomeWidget(sections: sectionsFromNetwork, design: design);
            }
            return HomeWidget(sections: sections, design: design);
          },
        );
      }
    );
  }
}
