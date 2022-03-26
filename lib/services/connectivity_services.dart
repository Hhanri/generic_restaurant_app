import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectivityService {
  static final _connectivity = Connectivity();
  static Future<bool> checkConnectivityState()async {
    return await _connectivity.checkConnectivity() != ConnectivityResult.none;
  }
}