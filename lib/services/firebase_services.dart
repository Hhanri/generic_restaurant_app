import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:generic_restaurant_app/resources/app_constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Stream get allRestaurantMenu {
    final response = _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).snapshots();
    return response;
  }

  void loadToFirebase() async {
    final String response = await rootBundle.loadString('assets/restaurant_menu.json');
    final data = await json.decode(response);
    _firebaseFirestore.collection(AppConstants.restaurantMenu).doc(AppConstants.restaurantMenu).set(data);
  }

  Future<String> downloadURL(String imagePath) async {
    String downloadURL = await firebaseStorage.ref(imagePath).getDownloadURL();
    return downloadURL;
  }
}
