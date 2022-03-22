import 'dart:ui';

import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(

  appBarTheme: const AppBarTheme(
    color: Colors.amberAccent,
    centerTitle: true,
    elevation: 0,
  ),

  scaffoldBackgroundColor: Colors.amberAccent,

  brightness: Brightness.light,
  primarySwatch: Colors.amber
);

class Design {

  static EdgeInsets padding = const EdgeInsets.all(8);

  static final ImageFilter blur = ImageFilter.blur(sigmaX: 3, sigmaY: 3);

  static final BorderRadius circularRadius = BorderRadius.circular(30);

  static Radius singleRadius = const Radius.circular(30);

  static BoxShadow shadow = BoxShadow(
    color: Colors.black.withOpacity(0.3),
    spreadRadius: 1,
    blurRadius: 3,
    offset: const Offset(0, 4), // changes position of shadow
  );

  static final BorderRadius bottomRadius = BorderRadius.only(
      topLeft: Design.singleRadius,
      topRight: Design.singleRadius
  );
}