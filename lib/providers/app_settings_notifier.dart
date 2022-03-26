import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';

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
    final response = await _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).snapshots().first;
    final data = response.data()!;
    state = AppSettings.generate(data[AppConstants.config]);
  }
}