import 'dart:convert' show json;
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/services.dart'show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier;
import 'package:generic_restaurant_app/models/app_settings_model.dart' show AppSettings;
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier() : super(_initialState);

  static final AppSettings _initialState = AppSettings.generateDefault();

  void fetchLocalSettings() async {
    final String response = await rootBundle.loadString("assets/config.json");
    final data = json.decode(response);
    state = AppSettings.generate(data[AppConstants.config]);
  }

  void fetchFirebaseConfig() async {
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    final response = await _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).snapshots().last;
    final data = response.data()!;
    state = AppSettings.generate(data[AppConstants.config]);
  }
}