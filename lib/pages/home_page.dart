import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/providers/providers.dart';
import 'package:generic_restaurant_app/widgets/scaffold_widget.dart';
import 'package:generic_restaurant_app/widgets/section_card_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.watch(restaurantMenuProvider.notifier).fetchLocalData();
      ref.watch(connectivityProvider.notifier).startListeningConnectivityState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool _hasInternet = ref.watch(connectivityProvider);
    if (!_hasInternet) {
      return const Center(child: CircularProgressIndicator(),);
    }
    return ScaffoldWidget(
      title: "HOME",
      child: Column(
        children: [
          ...ref.watch(restaurantMenuProvider).map(
            (section) => SectionCardWidget(
              section: section,
            )
          ).toList()
        ],
      )
    );
  }
}
