import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart' show BodyScaffoldWidget, ScaffoldWidgetParameters;

class NeumorphismWidget extends StatelessWidget {
  final ScaffoldWidgetParameters parameters;
  const NeumorphismWidget({
    Key? key,
    required this.parameters,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: parameters.design.padding,
      child: Container(
        decoration: parameters.design.neumorphism,
        child: Align(
          alignment: Alignment.topCenter,
          child: BodyScaffoldWidget(
            parameters: parameters
          ),
        ),
      ),
    );
  }
}
