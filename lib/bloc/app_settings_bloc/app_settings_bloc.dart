import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettings config;
  AppSettingsBloc({required this.config}) : super(AppSettingsLoadingState()) {

    on<FetchLocalConfigEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String response = prefs.getString("config") ?? await rootBundle.loadString("assets/config.json");
      final data = json.decode(response);
      config = (AppSettings.generate(data[AppConstants.config]));
      emit(AppSettingsLoadedState(config: config));
    });

    on<FetchFirebaseConfigEvent>((event, emit) async {
      final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
      _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
      final response = await _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).snapshots().first;
      final data = response.data()!;
      add(SaveConfigToLocalEvent(data: data));
      config = AppSettings.generate(data[AppConstants.config]);
      emit(AppSettingsLoadedState(config: config));
    });

    on<SaveConfigToLocalEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(AppConstants.config, json.encode(event.data));
    });
  }
}
