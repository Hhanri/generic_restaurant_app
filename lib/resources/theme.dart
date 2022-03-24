import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';

final ThemeData defaultTheme = ThemeData(
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
      padding: EdgeInsets.all(json[AppConstants.padding].toDouble()),
      blur: ImageFilter.blur(sigmaX: json[AppConstants.blur][AppConstants.x].toDouble(), sigmaY: json[AppConstants.blur][AppConstants.y].toDouble()),
      circularRadius: BorderRadius.circular(json[AppConstants.circularRadius].toDouble()),
      singleRadius: Radius.circular(json[AppConstants.singleRadius].toDouble()),
      shadow: BoxShadow(
        color: Color(int.parse(json[AppConstants.boxShadow][AppConstants.color])).withOpacity(json[AppConstants.boxShadow][AppConstants.opacity].toDouble()),
        spreadRadius: json[AppConstants.boxShadow][AppConstants.spreadRadius].toDouble(),
        blurRadius: json[AppConstants.boxShadow][AppConstants.blurRadius].toDouble(),
        offset: Offset(json[AppConstants.boxShadow][AppConstants.offSet][AppConstants.x].toDouble(), json[AppConstants.boxShadow][AppConstants.offSet][AppConstants.y].toDouble()), // changes position of shadow
      ),
      topRadius: BorderRadius.only(
        topLeft: Radius.circular(json[AppConstants.singleRadius].toDouble()),
        topRight: Radius.circular(json[AppConstants.singleRadius].toDouble())
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: List<Color>.from(json[AppConstants.gradient][AppConstants.colors].map((var value) => Color(int.parse(value)))),
        stops: List<double>.from(json[AppConstants.gradient][AppConstants.stops])
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