import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/theme.dart' show Design;

class NeumorphismWidget extends StatelessWidget {
  final Design design;
  final Widget child;
  const NeumorphismWidget({
    Key? key,
    required this.child,
    required this.design
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: design.padding,
      child: Container(
        decoration: design.neumorphism,
        child: Align(
          alignment: Alignment.topCenter,
          child: child,
        ),
      ),
    );
  }
}
