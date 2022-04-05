import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  List<SectionModel> sections;
  RestaurantMenuBloc({required this.sections}) : super(RestaurantMenuLoadingState()) {

    Future<List<SectionModel>> _fetchData({required Map<String, dynamic> data, required bool fromFirebase}) async {
      final List<SectionModel> treatedData = await SectionModel.listFromJson(
          data: data[AppConstants.restaurantMenu],
          fromFirebase: fromFirebase
      );
      return treatedData;
    }

    on<FetchLocalRestaurantMenuEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String response = prefs.getString(AppConstants.restaurantMenu) ?? await rootBundle.loadString('assets/restaurant_menu_bloc.json');
      final data = await json.decode(response);
      sections = await _fetchData(data: data, fromFirebase: false);
      emit(RestaurantMenuLoadedState(sections: sections));
    });

    on<FetchFirebaseRestaurantMenuEvent>((event, emit) async {
      final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
      _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
      final DocumentSnapshot<Map<String, dynamic>> response = await _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).snapshots().first;
      final Map<String, dynamic> data = response.data()!;
      sections = await _fetchData(data: data, fromFirebase: true);
      emit(RestaurantMenuLoadedState(sections: sections));
      final Map<String, dynamic> updatedData = {AppConstants.restaurantMenu : SectionModel.listToJson(sections)};
      add(SaveRestaurantMenuToLocalEvent(data: updatedData));
    });

    on<SaveRestaurantMenuToLocalEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(AppConstants.restaurantMenu, json.encode(event.data));
    });
  }
}
