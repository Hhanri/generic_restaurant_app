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
);

class Design {

  final EdgeInsets padding;
  final ImageFilter blur;
  final BorderRadius circularRadius;
  final Radius singleRadius;
  final BoxShadow shadow;
  final BorderRadius topRadius;
  final LinearGradient gradient;

  Design({
    required this.padding,
    required this.blur,
    required this.circularRadius,
    required this.singleRadius,
    required this.shadow,
    required this.topRadius,
    required this.gradient
  });

  factory Design.generate(Map<String, dynamic> json) {
    return Design(
      padding: EdgeInsets.all(json["padding"]),
      blur: ImageFilter.blur(sigmaX: json["blur"]["x"], sigmaY: json["blur"]["y"]),
      circularRadius: BorderRadius.circular(json["circularRadius"]),
      singleRadius: Radius.circular(json["singleRadius"]),
      shadow: BoxShadow(
        color: Color(int.parse(json["boxShadow"]["color"])).withOpacity(json["opacity"]),
        spreadRadius: json["spreadRadius"],
        blurRadius: json["blurRadius"],
        offset: Offset(json["offSet"]["x"], json["offSet"]["y"]), // changes position of shadow
      ),
      topRadius: BorderRadius.only(
        topLeft: Radius.circular(json["singleRadius"]),
        topRight: Radius.circular(json["singleRadius"])
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: json["gradient"]["colors"].map((String value) => Color(int.parse(value))).toList(),
        stops: json["gradient"]["stops"]
      )
    );
  }

  static Design defaultDesign = Design(
    padding: const EdgeInsets.all(8),
    blur: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    circularRadius: BorderRadius.circular(30),
    singleRadius: const Radius.circular(30),
    shadow: BoxShadow(
      color: Colors.black.withOpacity(0.6),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 4), // changes position of shadow
    ),
    topRadius: const BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30)
    ),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.87)],
      stops: const [0.0, 0.6, 0.8]
    )
  );
}