import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;

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
  final BorderRadius circularRadius;
  final Radius singleRadius;
  final BoxShadow shadow;
  final LinearGradient gradient;
  final BoxDecoration glassmorphism;
  final ImageFilter glassmorphismBlur;
  Design({
    required this.padding,
    required this.circularRadius,
    required this.singleRadius,
    required this.shadow,
    required this.gradient,
    required this.glassmorphism,
    required this.glassmorphismBlur,
  });

  factory Design.generate(Map<String, dynamic> json) {

    final EdgeInsets _padding = EdgeInsets.all(json[AppConstants.padding].toDouble());
    final BorderRadius _circularRadius = BorderRadius.all(Radius.circular(json[AppConstants.circularRadius].toDouble()));
    final Radius _singleRadius = Radius.circular(json[AppConstants.singleRadius].toDouble());
    final BoxShadow _shadow = BoxShadow(
      color: Color(int.parse(json[AppConstants.boxShadow][AppConstants.color])).withOpacity(json[AppConstants.boxShadow][AppConstants.opacity].toDouble()),
      spreadRadius: json[AppConstants.boxShadow][AppConstants.spreadRadius].toDouble(),
      blurRadius: json[AppConstants.boxShadow][AppConstants.blurRadius].toDouble(),
      offset: Offset(json[AppConstants.boxShadow][AppConstants.offSet][AppConstants.x].toDouble(), json[AppConstants.boxShadow][AppConstants.offSet][AppConstants.y].toDouble()), // changes position of shadow
    );
    final LinearGradient _gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: List<Color>.from(json[AppConstants.gradient][AppConstants.colors].map((var value) => Color(int.parse(value)))),
      stops: List<double>.from(json[AppConstants.gradient][AppConstants.stops])
    );
    final BoxDecoration _glassmorphism = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(json[AppConstants.circularRadius].toDouble())),
      border: Border.all(
        width: json[AppConstants.glassmorphism][AppConstants.borderWidth],
        color: Color(int.parse(json[AppConstants.glassmorphism][AppConstants.borderColor])).withOpacity(json[AppConstants.glassmorphism][AppConstants.borderOpacity])
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: List<Color>.from(json[AppConstants.glassmorphism][AppConstants.gradient][AppConstants.colors].map((var value) => Color(int.parse(value))))
      )
    );
    final ImageFilter _glassmorphismBlur = ImageFilter.blur(sigmaX: json[AppConstants.glassmorphism][AppConstants.blur][AppConstants.x].toDouble(), sigmaY: json[AppConstants.glassmorphism][AppConstants.blur][AppConstants.y].toDouble());

    return Design(
      padding: _padding,
      circularRadius: _circularRadius,
      singleRadius: _singleRadius,
      shadow: _shadow,
      gradient: _gradient,
      glassmorphism: _glassmorphism,
      glassmorphismBlur: _glassmorphismBlur,
    );
  }

  static Map<String, dynamic> designToJson(Design design) {
    return {
      AppConstants.padding : design.padding.bottom,
      AppConstants.circularRadius : design.circularRadius.bottomLeft,
      AppConstants.singleRadius : design.singleRadius.x,
      AppConstants.boxShadow : {
        AppConstants.color : design.shadow.color.value.toString(),
        AppConstants.opacity : design.shadow.color.opacity,
        AppConstants.spreadRadius : design.shadow.spreadRadius,
        AppConstants.blurRadius : design.shadow.blurRadius,
        AppConstants.offSet : {
          AppConstants.x : design.shadow.offset.dx,
          AppConstants.y : design.shadow.offset.dy
        }
      },
      AppConstants.gradient : {
        AppConstants.colors : design.gradient.colors.map((e) => e.value.toString()).toList(),
        AppConstants.stops : design.gradient.stops
      },
      AppConstants.glassmorphism : {
        AppConstants.borderWidth : design.glassmorphism.border!.bottom.width,
        AppConstants.borderColor : design.glassmorphism.border!.bottom.color.value.toString(),
        AppConstants.borderOpacity : design.glassmorphism.border!.bottom.color.opacity,
        AppConstants.blur : {
          AppConstants.x : 3,
          AppConstants.y : 3
        },
        AppConstants.gradient : {
          AppConstants.colors : design.glassmorphism.gradient!.colors.map((e) => e.value.toString()).toList()
        }
      }
    };
  }

  static Design defaultDesign = Design(
    padding: const EdgeInsets.all(8),
    glassmorphismBlur: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    circularRadius: const BorderRadius.all(Radius.circular(30)),
    singleRadius: const Radius.circular(30),
    shadow: BoxShadow(
      color: Colors.black.withOpacity(0.6),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 4), // changes position of shadow
    ),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.87)],
      stops: const [0.0, 0.6, 0.8]
    ),
    glassmorphism: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      border: Border.all(
        width: 1.5,
        color: Colors.white.withOpacity(0.1)
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white.withOpacity(0.6), Colors.white.withOpacity(0.1)]
      )
    ),
  );
}