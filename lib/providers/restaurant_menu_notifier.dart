import 'dart:convert' show json;
import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, FirebaseFirestore, Settings;
import 'package:flutter/services.dart' show rootBundle;
import 'package:generic_restaurant_app/models/section_model.dart' show SectionModel;
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;
import 'package:riverpod/riverpod.dart' show StateNotifier;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class RestaurantMenuNotifier extends StateNotifier<List<SectionModel>> {
  RestaurantMenuNotifier() : super(_initialState);

  static const List<SectionModel> _initialState = [];

  void fetchLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String response = prefs.getString(AppConstants.restaurantMenu) ?? await rootBundle.loadString('assets/restaurant_menu_bloc.json');
    final data = await json.decode(response);
    state = await _fetchData(data: data, fromFirebase: false);
  }

  void fetchFirebaseData() async {
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
    final DocumentSnapshot<Map<String, dynamic>> response = await _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).snapshots().first;
    final Map<String, dynamic> data = response.data()!;

    state = await _fetchData(data: data, fromFirebase: true);
    final Map<String, dynamic> updatedData = {AppConstants.restaurantMenu : SectionModel.listToJson(state)};
    saveConfig(updatedData);
  }

  Future<List<SectionModel>> _fetchData({required Map<String, dynamic> data, required bool fromFirebase}) async {
    final List<SectionModel> treatedData = await SectionModel.listFromJson(
      data: data[AppConstants.restaurantMenu],
      fromFirebase: fromFirebase
    );
    return treatedData;
  }

  static void saveConfig(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.restaurantMenu, json.encode(data));
  }
}