import 'package:flutter/material.dart' show ScrollBehavior, Widget, BuildContext, AxisDirection;

class CustomScroll extends ScrollBehavior {

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection
  ) {
    return child;
  }
}