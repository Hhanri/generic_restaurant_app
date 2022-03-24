import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/theme.dart';

class GlassmorphismWidget extends StatelessWidget {
  final Design design;
  final Widget child;
  const GlassmorphismWidget({
    Key? key,
    required this.child,
    required this.design
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: design.padding,
      child: ClipRRect(
        borderRadius: design.circularRadius,
        child: BackdropFilter(
          filter: design.glassmorphismBlur,
          child: Container(
            decoration: design.glassmorphism,
            child: Align(
              alignment: Alignment.topCenter,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
