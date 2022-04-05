import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_restaurant_app/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:generic_restaurant_app/models/app_settings_model.dart';
import 'package:generic_restaurant_app/pages/home_page.dart';
import 'package:generic_restaurant_app/services/connectivity_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => ConnectivityService(),
      child: BlocProvider(
        create: (BuildContext context) => RestaurantBloc(
          connectivity: RepositoryProvider.of<ConnectivityService>(context),
          sections: [],
          config: AppSettings.generateDefault()
        ),
        child: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            AppSettings config = BlocProvider.of<RestaurantBloc>(context).config;
            if (state is RestaurantLoadedState) {
              config = state.config;
            }
            return MaterialApp(
              title: 'Restaurant App',
              theme: config.theme,
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
