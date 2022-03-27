import 'dart:convert' show json;
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore, Settings;
import 'package:flutter/services.dart'show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier;
import 'package:generic_restaurant_app/models/app_settings_model.dart' show AppSettings;
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier() : super(_initialState);

  static final AppSettings _initialState = AppSettings.generateDefault();

  void fetchLocalConfig() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String response = prefs.getString("config") ?? await rootBundle.loadString("assets/config.json");
    final data = json.decode(response);
    state = (AppSettings.generate(data[AppConstants.config]));
  }

  void fetchFirebaseConfig() async {
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
    final response = await _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).snapshots().first;
    final data = response.data()!;
    saveConfig(data);
    state = AppSettings.generate(data[AppConstants.config]);
  }

  static void saveConfig(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.config, json.encode(data));
  }
}