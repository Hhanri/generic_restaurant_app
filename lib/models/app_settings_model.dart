import 'package:flutter/material.dart';
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
      brightness: json["brightness"] == "dark" ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        color: Color(int.parse(json["mainColor"])),
        centerTitle: true,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Color(int.parse(json["mainColor"])),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: Color(int.parse(json["fontColor"]))
        ),
    )
    );
  }

  factory AppSettings.generate(Map<String, dynamic> json) {
    return AppSettings(
      appTitle: json["appTitle"],
      theme: generateTheme(json["theme"]),
      design: Design.generate(json["design"])
    );
  }
}