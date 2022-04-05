import 'dart:convert' show json;
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/services.dart' show rootBundle;
import 'package:generic_restaurant_app/resources/app_constants.dart' show AppConstants;
import 'package:firebase_storage/firebase_storage.dart' show FirebaseStorage;

class FirebaseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  void loadMenuToFirebase() async {
    final String response = await rootBundle.loadString('assets/restaurant_menu_bloc.json');
    final data = await json.decode(response);
    _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).set(data);
  }

  void loadConfigToFirebase() async {
    final String response = await rootBundle.loadString('assets/config.json');
    final data = await json.decode(response);
    _firebaseFirestore.collection(AppConstants.config).doc(AppConstants.config).set(data);
  }

  Future<String> downloadURL(String imagePath) async {
    String downloadURL = await _firebaseStorage.ref(imagePath).getDownloadURL();
    return downloadURL;
  }
}
