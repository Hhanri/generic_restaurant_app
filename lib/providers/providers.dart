import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifierProvider;
import 'package:generic_restaurant_app/models/app_settings_model.dart' show AppSettings;
import 'package:generic_restaurant_app/models/section_model.dart' show SectionModel;
import 'package:generic_restaurant_app/providers/app_settings_notifier.dart' show AppSettingsNotifier;
import 'package:generic_restaurant_app/providers/restaurant_menu_notifier.dart' show RestaurantMenuNotifier;

final StateNotifierProvider<RestaurantMenuNotifier, List<SectionModel>> restaurantMenuProvider = StateNotifierProvider<RestaurantMenuNotifier, List<SectionModel>>(
    (ref) =>RestaurantMenuNotifier()
);

final StateNotifierProvider<AppSettingsNotifier, AppSettings> appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>(
    (ref) => AppSettingsNotifier()
);