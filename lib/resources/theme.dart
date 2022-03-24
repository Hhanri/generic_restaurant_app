import 'dart:ui';

import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  textTheme: const TextTheme(
    headline4: TextStyle(
      color: Colors.white
    ),
    headline6: TextStyle(
      color: Colors.white
    ),
  ),
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
    color: Colors.black.withOpacity(0.6),
    spreadRadius: 2,
    blurRadius: 4,
    offset: const Offset(0, 4), // changes position of shadow
  );

  static final BorderRadius topRadius = BorderRadius.only(
      topLeft: Design.singleRadius,
      topRight: Design.singleRadius
  );

  static LinearGradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.87)],
      stops: const [0.0, 0.6, 0.8]
  );
}