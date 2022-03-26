import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/pages/home_page.dart';
import 'package:generic_restaurant_app/providers/providers.dart';
import 'package:generic_restaurant_app/services/connectivity_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      final hasInternet = await ConnectivityService.checkConnectivityState();
      if (hasInternet == true) {
        ref.watch(appSettingsProvider.notifier).fetchFirebaseConfig();
        ref.watch(restaurantMenuProvider.notifier).fetchFirebaseData();
      } else {
        ref.watch(appSettingsProvider.notifier).fetchLocalSettings();
        ref.watch(restaurantMenuProvider.notifier).fetchLocalData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ref.watch(appSettingsProvider).theme,
      home: const HomeScreen(),
    );
  }
}
