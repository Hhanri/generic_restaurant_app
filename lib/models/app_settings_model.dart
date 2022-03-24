import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';
import 'package:generic_restaurant_app/resources/theme.dart';

class AppSettings {
  final String appTitle;
  final ThemeData theme;
  final Design design;

  AppSettings({
    required this.appTitle,
    required this.theme,
    required this.design
  });

  static ThemeData generateTheme(Map<String, dynamic> json) {
    return ThemeData(
      brightness: json[AppConstants.brightness] == "dark" ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        color: Color(int.parse(json[AppConstants.mainColor])),
        centerTitle: true,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Color(int.parse(json[AppConstants.mainColor])),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: Color(int.parse(json[AppConstants.fontColor]))
        ),
    )
    );
  }

  factory AppSettings.generate(Map<String, dynamic> json) {
    return AppSettings(
      appTitle: json[AppConstants.appTitle],
      theme: generateTheme(json[AppConstants.theme]),
      design: Design.generate(json[AppConstants.design])
    );
  }

  factory AppSettings.generateDefault() {
    return AppSettings(
      appTitle: "Restaurant",
      theme: defaultTheme,
      design: Design.defaultDesign
    );
  }
}