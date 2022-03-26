import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';
import 'package:riverpod/riverpod.dart';

class RestaurantMenuNotifier extends StateNotifier<List<SectionModel>> {
  RestaurantMenuNotifier() : super(_initialState);

  static const List<SectionModel> _initialState = [];

  void fetchLocalData() async {
    final String response = await rootBundle.loadString('assets/restaurant_menu.json');
    final data = await json.decode(response);
    state = await _fetchData(data: data, fromFirebase: false);
  }

  void fetchFirebaseData() async {
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    final response = await _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).snapshots().first;
    final data = response.data()!;
    state = await _fetchData(data: data, fromFirebase: true);
  }

  Future<List<SectionModel>> _fetchData({required Map<String, dynamic> data, required bool fromFirebase}) async {
    final List<SectionModel> treatedData = await SectionModel.listFromJson(
      data: data[AppConstants.restaurantMenu],
      fromFirebase: fromFirebase
    );
    return treatedData;
  }
}