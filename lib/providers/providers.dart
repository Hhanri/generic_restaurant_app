import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/providers/connectivity_notifier.dart';
import 'package:generic_restaurant_app/providers/restaurant_menu_notifier.dart';

final StateNotifierProvider<RestaurantMenuNotifier, List<SectionModel>> restaurantMenuProvider = StateNotifierProvider<RestaurantMenuNotifier, List<SectionModel>>(
    (ref) =>RestaurantMenuNotifier()
);

final StateNotifierProvider<ConnectivityNotifier, bool> connectivityProvider = StateNotifierProvider<ConnectivityNotifier, bool>(
      (ref) => ConnectivityNotifier()
);