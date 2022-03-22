import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/pages/home_page.dart';
import 'package:generic_restaurant_app/resources/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
