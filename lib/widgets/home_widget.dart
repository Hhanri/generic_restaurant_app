import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart' show AppSettings;
import 'package:generic_restaurant_app/models/section_model.dart' show SectionModel;
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart';
import 'package:generic_restaurant_app/widgets/section_card_widget.dart';

class HomeWidget extends StatelessWidget {
  final List<SectionModel> sections;
  final AppSettings settings;
  const HomeWidget({
    Key? key,
    required this.sections,
    required this.settings
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      parameters: HomeScaffoldWidgetParameters(
        title: settings.appTitle,
        child: Column(
          children: [
            ...sections.map(
              (section) => SectionCardWidget(
                section: section,
              )
            ).toList()
          ],
        ),
        design: settings.design,
      )
    );
  }
}
