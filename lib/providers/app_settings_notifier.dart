import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart';

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier() : super(_initialState);

  static final AppSettings _initialState = AppSettings.generateDefault();

  void loadSettings() async {
    final String response = await rootBundle.loadString("assets/config.json");
    final data = json.decode(response);
    state = AppSettings.generate(data);
  }
}