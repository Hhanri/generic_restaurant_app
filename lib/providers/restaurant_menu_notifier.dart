import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:riverpod/riverpod.dart';

class RestaurantMenuNotifier extends StateNotifier<List<SectionModel>> {
  RestaurantMenuNotifier() : super(_initialState);

  static const List<SectionModel> _initialState = [];

  void fetchLocalData() async{
    final String response = await rootBundle.loadString('assets/restaurant_menu.json');
    final data = await json.decode(response);
    final List<SectionModel> treatedData = SectionModel.listFromJson(data);
    state = treatedData;
  }
}