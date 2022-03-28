import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/theme.dart' show Design;
import 'package:generic_restaurant_app/widgets/custom_scroll_widget.dart';
import 'package:generic_restaurant_app/widgets/glassmorphism_widget.dart';
import 'package:generic_restaurant_app/widgets/neumorphism_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  final ScaffoldWidgetParameters parameters;
  const ScaffoldWidget({
    Key? key,
    required this.parameters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          parameters.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: parameters is SectionScaffoldWidgetParameters
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.transparent,
      ),
      backgroundColor: parameters is SectionScaffoldWidgetParameters
        ? Colors.transparent
        : Theme.of(context).scaffoldBackgroundColor,
      body: parameters is SectionScaffoldWidgetParameters
        ? GlassmorphismWidget(
            parameters: parameters,
          )
        : NeumorphismWidget(
            parameters: parameters,
          )
    );
  }
}

class BodyScaffoldWidget extends StatelessWidget {
  final ScaffoldWidgetParameters parameters;
  const BodyScaffoldWidget({
    Key? key,
    required this.parameters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: CustomScroll(),
        child: SingleChildScrollView(
          child: Padding(
            padding: parameters.design.padding,
            child: parameters.child
          )
        )
    );
  }
}


class ScaffoldWidgetParameters {
  final String title;
  final Widget child;
  final Design design;
  ScaffoldWidgetParameters({
    required this.title,
    required this.child,
    required this.design
  });
}

class HomeScaffoldWidgetParameters extends ScaffoldWidgetParameters {
  HomeScaffoldWidgetParameters({
    required String title,
    required Widget child,
    required Design design,
  }) : super(
    title: title,
    design: design,
    child: child
  );
}

class SectionScaffoldWidgetParameters extends ScaffoldWidgetParameters {
  SectionScaffoldWidgetParameters({
    required String title,
    required Widget child,
    required Design design,
  }) : super(
    title: title,
    design: design,
    child: child
  );
}