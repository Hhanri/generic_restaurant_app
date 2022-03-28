import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart' show BodyScaffoldWidget, ScaffoldWidgetParameters;

class GlassmorphismWidget extends StatelessWidget {
  final ScaffoldWidgetParameters parameters;
  const GlassmorphismWidget({
    Key? key,
    required this.parameters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: parameters.design.padding,
      child: ClipRRect(
        borderRadius: parameters.design.circularRadius,
        child: BackdropFilter(
          filter: parameters.design.glassmorphismBlur,
          child: Container(
            decoration: parameters.design.glassmorphism,
            child: Align(
              alignment: Alignment.topCenter,
              child: BodyScaffoldWidget(
                parameters: parameters
              ),
            ),
          ),
        ),
      ),
    );
  }
}
