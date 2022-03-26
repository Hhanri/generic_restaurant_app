import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/theme.dart' show Design;
import 'package:generic_restaurant_app/widgets/custom_scroll_widget.dart';
import 'package:generic_restaurant_app/widgets/glassmorphism_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final Design design;
  const ScaffoldWidget({
    Key? key,
    required this.title,
    required this.child,
    required this.design
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: GlassmorphismWidget(
        design: design,
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Padding(
              padding: design.padding,
              child: child
            )
          )
        ),
      ),
    );
  }
}
