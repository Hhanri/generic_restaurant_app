import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  final connectivityStream = StreamController<ConnectivityResult>();

  ConnectivityService()  {
    _connectivity.onConnectivityChanged.listen((event) async {
      connectivityStream.add(event);
    });
  }

  Future<ConnectivityResult> get getResult async => await _connectivity.checkConnectivity();
}