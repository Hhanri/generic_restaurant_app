import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/providers/app_settings_notifier.dart';
import 'package:generic_restaurant_app/providers/restaurant_menu_notifier.dart';
import 'package:generic_restaurant_app/services/firebase_services.dart';

final StateNotifierProvider<RestaurantMenuNotifier, List<SectionModel>> restaurantMenuProvider = StateNotifierProvider<RestaurantMenuNotifier, List<SectionModel>>(
    (ref) =>RestaurantMenuNotifier()
);

final StateNotifierProvider<AppSettingsNotifier, AppSettings> appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>(
    (ref) => AppSettingsNotifier()
);

final firebaseProvider = Provider((ref) => FirebaseServices());