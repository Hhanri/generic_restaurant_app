import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/services/connectivity_services.dart';

class ConnectivityNotifier extends StateNotifier<bool> {
  ConnectivityNotifier() : super(false);

  static final connectivity = ConnectivityService();

  void startListeningConnectivityState() {
    connectivity.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        state = false;
      } else {
        state = true;
      }
    });
  }
}