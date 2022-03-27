import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;
import 'package:generic_restaurant_app/resources/theme.dart' show Design, defaultTheme;

class AppSettings {
  final String appTitle;
  final ThemeData theme;
  final bool useDefaultTheme;
  final Design design;

  AppSettings({
    required this.appTitle,
    required this.theme,
    required this.useDefaultTheme,
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
        headline6: TextStyle(
          color: Color(int.parse(json[AppConstants.fontColor]))
        ),
      )
    );
  }

  static Map<String, dynamic> themeToJson(ThemeData theme) {
    return {
      AppConstants.brightness : theme.brightness.name,
      AppConstants.mainColor : theme.scaffoldBackgroundColor.value.toString(),
      AppConstants.fontColor : theme.textTheme.headline4!.color!.value.toString()
    };
  }

  factory AppSettings.generate(Map<String, dynamic> json) {
    return AppSettings(
      appTitle: json[AppConstants.appTitle],
      theme: generateTheme(json[AppConstants.theme]),
      design: Design.generate(json[AppConstants.design]),
      useDefaultTheme: json[AppConstants.useDefaultTheme]
    );
  }

  Map<String, dynamic> toJson(AppSettings settings) {
    return {
      AppConstants.config : {
        AppConstants.appTitle : settings.appTitle,
        AppConstants.useDefaultTheme : settings.useDefaultTheme,
        AppConstants.theme : themeToJson(settings.theme),
        AppConstants.design : Design.designToJson(settings.design)
      }
    };
  }

  factory AppSettings.generateDefault() {
    return AppSettings(
      appTitle: "Restaurant",
      theme: defaultTheme,
      useDefaultTheme: false,
      design: Design.defaultDesign
    );
  }
}