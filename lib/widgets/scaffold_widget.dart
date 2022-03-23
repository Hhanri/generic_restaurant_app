import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:generic_restaurant_app/widgets/custom_scroll_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const ScaffoldWidget({
    Key? key,
    required this.title,
    required this.child
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
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: Design.bottomRadius
        ),
        child: Padding(
          padding: Design.padding,
          child: Align(
            alignment: Alignment.topCenter,
            child: ScrollConfiguration(
              behavior: CustomScroll(),
              child: SingleChildScrollView(child: child)
            ),
          )
        )
      ),
    );
  }
}
