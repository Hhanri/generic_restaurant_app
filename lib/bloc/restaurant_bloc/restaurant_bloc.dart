import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantMenuEvent, RestaurantState> {
  List<SectionModel> sections;
  AppSettings config;
  RestaurantBloc({required this.sections, required this.config}) : super(RestaurantLoadingState()) {

    Future<List<SectionModel>> _fetchData({required Map<String, dynamic> data, required bool fromFirebase}) async {
      final List<SectionModel> treatedData = await SectionModel.listFromJson(
        data: data[AppConstants.restaurantMenu],
        fromFirebase: fromFirebase
      );
      return treatedData;
    }

    on<FetchLocalRestaurantEvent>((event, emit) async {
      //fetching menu
      final SharedPreferences menuPrefs = await SharedPreferences.getInstance();
      final String menuResponse = menuPrefs.getString(AppConstants.restaurantMenu) ?? await rootBundle.loadString('assets/restaurant_bloc.json');
      final menuData = await json.decode(menuResponse);
      sections = await _fetchData(data: menuData, fromFirebase: false);
      //fetching config
      final SharedPreferences configPrefs = await SharedPreferences.getInstance();
      final String configResponse = configPrefs.getString("config") ?? await rootBundle.loadString("assets/config.json");
      final configData = json.decode(configResponse);
      config = (AppSettings.generate(configData[AppConstants.config]));

      emit(RestaurantLoadedState(sections: sections, config: config));
    });

    on<FetchFirebaseRestaurantEvent>((event, emit) async {
      final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
      _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
      //fetching menu
      final DocumentSnapshot<Map<String, dynamic>> menuResponse = await _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).snapshots().first;
      final Map<String, dynamic> menuData = menuResponse.data()!;
      sections = await _fetchData(data: menuData, fromFirebase: true);
      //fetching config
      final DocumentSnapshot<Map<String, dynamic>> configResponse = await _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).snapshots().first;
      final Map<String, dynamic> configData = configResponse.data()!;
      config = AppSettings.generate(configData[AppConstants.config]);

      emit(RestaurantLoadedState(sections: sections, config: config));

      final Map<String, dynamic> updatedMenuData = {AppConstants.restaurantMenu : SectionModel.listToJson(sections)};
      add(SaveRestaurantToLocalEvent(menu: updatedMenuData, config: configData));
    });

    on<SaveRestaurantToLocalEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(AppConstants.restaurantMenu, json.encode(event.menu));
      prefs.setString(AppConstants.config, json.encode(event.config));
    });
  }
}
