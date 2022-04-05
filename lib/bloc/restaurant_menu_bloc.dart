import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:meta/meta.dart';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  RestaurantMenuBloc() : super(RestaurantMenuLoadingState()) {
    on<RestaurantMenuEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
